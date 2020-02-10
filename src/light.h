/* Last Modified: 1 Nov. 2009 BHL */

#ifndef _LIGHT_H
#define _LIGHT_H

#include "xvec.h"
#include <stdlib.h>

/// point number between 0 and 1
extern float frand();

/// Base interface class for the lights in the scene
class ILight {
public:
  virtual ~ILight() {}

  /// samples a position on the light possibly using the hint index
  virtual XVec3f SamplePos() const = 0;

  /// returns the color value of the light
  virtual XVec3f Color() const = 0;

  /// sets the hint index for the light
  virtual void HintSample(int k) = 0;

  /// returns the jittered samples array pointer if available
  /// if the jittering cannot be used returns NULL
  virtual std::vector<XVec2f> *Jitters() = 0;
};

/// A simple point light class
class PointLightT : public ILight {
public:
  PointLightT(const XVec3f &_pos, const XVec3f &_color)
      : m_pos(_pos), m_color(_color) {}
  virtual ~PointLightT() {}
  virtual XVec3f SamplePos() const { return m_pos; }
  virtual XVec3f Color() const { return m_color; }
  virtual void HintSample(int k) {}
  virtual std::vector<XVec2f> *Jitters() { return NULL; }

private:
  XVec3f m_pos;
  XVec3f m_color;
};

/// An area light class
class AreaLightT : public ILight {
public:
  AreaLightT(const XVec3f &_corner, const XVec3f &_veca, const XVec3f &_vecb,
             const XVec3f &_color)
      : m_corner(_corner), m_veca(_veca), m_vecb(_vecb), m_color(_color) {}

  virtual ~AreaLightT() {}

  virtual XVec3f SamplePos() const {
    float epsa = frand();
    float epsb = frand();
    return (m_corner + epsa * m_veca + epsb * m_vecb);
  }

  virtual XVec3f Color() const { return (m_color); }
  virtual void HintSample(int k) {}
  virtual std::vector<XVec2f> *Jitters() { return (NULL); }

private:
  XVec3f m_corner;
  XVec3f m_veca;
  XVec3f m_vecb;
  XVec3f m_color;
};

#endif
