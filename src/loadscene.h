#ifndef _LOADSCENE_H
#define _LOADSCENE_H

#include "raytracer.h"
#include "scene.h"

bool LoadScene(SceneT &s, CameraT &cam, OptionsT &opts, const char *filename);

#endif
