/* Last Modified: 2 Nov. 2009 BHL */

#include "raytracer.h"

#include <iostream>
#include <stdlib.h>

using namespace std;

const float FRESNEL_CONST = 0.8;

/// point number between 0 and 1
float frand() { return float(rand()) / (RAND_MAX); }

void RayTracerT::TraceAll(const CameraT &cam, XImageT<XVec3b> &image) {
  // viewing rays generation setup here

  // compute half vertical distance of near plane
  float v_dist_2 = tan(cam.m_fovy / 2.0) * cam.m_wdist;

  // compute aspect ratio (assume square pixels)
  float aspect = cam.m_nx / cam.m_ny;
  float u_dist_2 = v_dist_2 * aspect;

  // compute the position of the lower left of the image in world space
  XVec3f p_ul = cam.m_eyepos - cam.m_wdist * cam.m_eyew -
                u_dist_2 * cam.m_eyeu - v_dist_2 * cam.m_eyev;

  // compute the delta vectors to transition between pixels
  XVec3f delta_v = cam.m_eyev * (2.0 * v_dist_2) / float(cam.m_ny);
  XVec3f delta_u = cam.m_eyeu * (2.0 * u_dist_2) / float(cam.m_nx);

  // antialiasing and area light setup goes here
  srand(time(0));
  int num_aasamples = m_opts.m_aasample;

  /// The main loop over all the pixels in the output image
  for (int i = 0; i < cam.m_nx; ++i) {
    for (int j = 0; j < cam.m_ny; ++j) {

      if ((i * cam.m_ny + j) % 1000 == 0)
        cout << "ray: " << i * cam.m_ny + j << " of " << cam.m_nx * cam.m_ny
             << endl;

      // generate a ray from the eye
      XVec3f color(0.0f);

      if (num_aasamples <= 0) {
        // compute ray origin on near plane as displacement from upper-left
        XVec3f vray_o = p_ul + delta_v * (j + 0.5) + delta_u * (i + 0.5);

        // compute ray direction
        XVec3f vray_d = vray_o - cam.m_eyepos;
        vray_d.normalize();

        // instantiate ray
        ray_t vray(vray_o, vray_d);

        // trace
        color = Trace(vray);
      } else {
        // antialiasing / jitter regular samples
        for (int p = 0; p < num_aasamples; p++) {
          for (int q = 0; q < num_aasamples; q++) {
            // compute ray origin on near plane as displacement from upper-left
            float eps = frand();
            XVec3f vray_o =
                p_ul + delta_v * (j + float(q + eps) / float(num_aasamples)) +
                delta_u * (i + float(p + eps) / float(num_aasamples));

            // compute ray direction
            XVec3f vray_d = vray_o - cam.m_eyepos;
            vray_d.normalize();

            // instantiate ray
            ray_t vray(vray_o, vray_d);

            // trace
            color += Trace(vray);
          }
        }

        // normalize color vector by number of samples
        color /= float(num_aasamples * num_aasamples);
      }

      // image pixel is assigned here -- simple clamping performed
      image.at(i, j) = XVec3b((unsigned char)(0xFF * std::min(1.0f, color(0))),
                              (unsigned char)(0xFF * std::min(1.0f, color(1))),
                              (unsigned char)(0xFF * std::min(1.0f, color(2))));
    }
  }
}

/// Returns the color from the shading computation using
/// the information in the hitinfo_t structure
/// level is the recursion level
XVec3f RayTracerT::Shade(const hitinfo_t &hit, int level) {
  XVec3f color(0.0f);

  // compute ambient light contribution
  color = hit.m_mat.m_ca * hit.m_mat.m_cr;

  // compute unit normal
  XVec3f n_unit = hit.m_normal;
  n_unit.normalize();

  // compute unit indir
  XVec3f in_unit = -hit.m_indir;
  in_unit.normalize();

  // iterate over the lights and collect their contribution
  for (std::vector<ILight *>::const_iterator it = m_scene.BeginLights();
       it != m_scene.EndLights(); it++) {
    // compute ray from hit point to ith light position
    XVec3f l_unit = (*it)->SamplePos() - hit.m_pos;
    l_unit.normalize();

    // only add contributions from unoccluded light sources
    hitinfo_t thit;
    ray_t sray(hit.m_pos, l_unit);
    if (!m_scene.Intersect(sray, thit)) {
      // compute diffuse contribution
      float diffuse = max(0.0f, n_unit.dot(l_unit));

      // compute half-way vector
      XVec3f h_unit = (l_unit + in_unit);
      h_unit.normalize();

      // compute specular contribution
      float spec = max(0.0f, n_unit.dot(h_unit));
      spec = pow(spec, hit.m_mat.m_p);

      // sum diffuse + specular (ignoring emission and attenuation)
      color += diffuse * (*it)->Color() * hit.m_mat.m_cr +
               spec * (*it)->Color() * hit.m_mat.m_cp;
    }
  }

  // if there is a non-zero specular term
  if (hit.m_mat.m_cp.l2()) {
    // compute reflection vector r_v = 2 * n * (n.dot(in)) - in;
    XVec3f r_ray_d = 2.0 * n_unit * n_unit.dot(in_unit) - in_unit;
    r_ray_d.normalize();

    // make a recursive call to Trace() function to get the reflections
    // compute reflection as modulated by specular reflectance
    ray_t r_ray(hit.m_pos, r_ray_d);

    // HACK: no Fresnel, so use expoential decrease 0.8 decrease at each level
    color += FRESNEL_CONST * Trace(r_ray, level + 1);
  }

  return (color);
}

/// Returns the color value coming along the ray
/// level is the recursion level
XVec3f RayTracerT::Trace(const ray_t &ray, int level) {
  // limit the recursion level here
  if (level >= m_opts.m_max_recursion)
    return XVec3f(0.0);

  XVec3f color;
  hitinfo_t hit;

  if (!m_scene.Intersect(ray, hit))
    return m_scene.BackgroundColor();

  color = Shade(hit, level);

  return color;
}
