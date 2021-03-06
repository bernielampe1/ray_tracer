/* Last Modified: 3 Nov. 2009 BHL */

#ifndef _CYLINDER_H
#define _CYLINDER_H

#include "gel.h"

#include "xform.h"

#include <iostream>

/// Cylinder class
class CylinderT : public IGel {
public:
  CylinderT() {}
  CylinderT(const XFormf &_xf = XFormf::Identity()) : m_xf(_xf) {
    m_xfi = m_xf.Inverse();
  }

  virtual ~CylinderT() {}

  // Intersect testing, using the stored transformations
  virtual bool Intersect(const ray_t &wray, hitinfo_t &hit) const {
    // transform the ray into the coordinate system of the cylinder
    ray_t ray(m_xfi.apply(wray.m_origin), m_xfi.applyv(wray.m_dir));

    // if a point (p) is on the unit cylinder along the z-axis then
    // p_x^2 + p_y^2 - 1 = 0 && 0 <= p_z <= 1
    // then given ray = r + t * d
    // (r_x + t * d_x)^2 + (r_y + t * d_y) ^2 - 1 = 0
    // multiply out and then
    // t^2 * (d_x^2 + d_y^2) + 2 * t * (r_x * d_x + r_y * d_y) + r_x^2 + r_y^2
    // - 1 = 0
    float a = ray.m_dir(0) * ray.m_dir(0) + ray.m_dir(1) * ray.m_dir(1);
    float b =
        2.0 * (ray.m_origin(0) * ray.m_dir(0) + ray.m_origin(1) * ray.m_dir(1));
    float c = ray.m_origin(0) * ray.m_origin(0) +
              ray.m_origin(1) * ray.m_origin(1) - 1.0;

    // compute intersection points
    float t1, t2;

    // check if ray is parallel to z-axis and origin is in the xy unit circle
    if (a <= 0.0) {
      // if origin is within the unit circle
      if (c > 0.0)
        return false;

      // above cylinder pointing down
      if (ray.m_origin(2) >= 1.0 && ray.m_dir(2) < 0.0) {
        hit.m_t = ray.m_origin(2) - 1.0;
        hit.m_pos = ray.at(hit.m_t);
        hit.m_normal = XVec3f(0.0, 0.0, 1.0);
        hit.m_mat = m_mat;
        return (true);
      }
      // below cylinder pointing up
      else if (ray.m_origin(2) <= 0.0 && ray.m_dir(2) > 0.0) {
        hit.m_t = -ray.m_origin(2);
        hit.m_pos = ray.at(hit.m_t);
        hit.m_normal = XVec3f(0.0, 0.0, -1.0);
        hit.m_mat = m_mat;
        return (true);
      } else {
        return false;
      }
    } else {
      // compute and test descriminant
      float det = b * b - 4.0 * a * c;
      if (det <= 0.0)
        return false;

      t1 = 0.5f * (-b - sqrt(det)) / a;
      t2 = 0.5f * (-b + sqrt(det)) / a;
    }

    // flags to keep track of clipped parameters
    bool t1_ct = false;
    bool t2_ct = false;
    bool t1_cb = false;
    bool t2_cb = false;

    // clip ray to top end cap plane
    if (ray.m_dir(2) < 0) {
      float tint = (1.0 - ray.m_origin(2)) / ray.m_dir(2);
      t1 = (t1 > tint) ? t1 : tint;
      t1_ct = (t1 > tint) ? false : true;
    } else if (ray.m_dir(2) > 0) {
      float tint = (1.0 - ray.m_origin(2)) / ray.m_dir(2);
      t2 = (t2 < tint) ? t2 : tint;
      t2_ct = (t2 < tint) ? false : true;
    } else if (ray.m_origin(2) - 1.0 > 0) {
      t1 = t2 + 1;
    }

    // clip ray to bottom end cap plane
    if (-ray.m_dir(2) < 0) {
      float tint = -ray.m_origin(2) / ray.m_dir(2);
      t1 = (t1 > tint) ? t1 : tint;
      t1_cb = (t1 > tint) ? false : true;
    } else if (-ray.m_dir(2) > 0) {
      float tint = -ray.m_origin(2) / ray.m_dir(2);
      t2 = (t2 < tint) ? t2 : tint;
      t2_cb = (t2 < tint) ? false : true;
    } else if (-ray.m_origin(2) > 0) {
      t1 = t2 + 1;
    }

    // if both ends cropped outside of the end caps
    if (t1 > t2)
      return false;

    // intersection with smallest positive value
    if (t1 > 0) {
      hit.m_t = t1;
      hit.m_pos = ray.at(t1);
      hit.m_mat = m_mat;

      if (t1_ct)
        hit.m_normal = XVec3f(0.0, 0.0, 1.0);
      else if (t1_cb)
        hit.m_normal = XVec3f(0.0, 0.0, -1.0);
      else
        hit.m_normal = XVec3f(hit.m_pos(0), hit.m_pos(1), 0.0);
    } else if (t2 > 0) {
      hit.m_t = t2;
      hit.m_pos = ray.at(t2);
      hit.m_mat = m_mat;

      if (t2_ct)
        hit.m_normal = XVec3f(0.0, 0.0, 1.0);
      else if (t2_cb)
        hit.m_normal = XVec3f(0.0, 0.0, -1.0);
      else
        hit.m_normal = XVec3f(hit.m_pos(0), hit.m_pos(1), 0.0);
    } else {
      return (false);
    }

    // transform it back to the world coordinate frame
    hit.m_pos = m_xf.apply(hit.m_pos);
    hit.m_normal = m_xfi.applytv(hit.m_normal);
    hit.m_normal.normalize();

    return (true);
  }

public:
  XFormf m_xf, m_xfi;
  MaterialT m_mat;
};

#endif
