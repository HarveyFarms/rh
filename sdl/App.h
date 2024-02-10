#ifndef APP_H
#define APP_H

#include <SDL2/SDL.h>

const int WIN_X = 1920;
const int WIN_Y = 1080;

class App 
{
public:
  bool init();
  void prepare_scene();
  void handle_input();
  void present_scene();
  bool is_running();
private:
  SDL_Window * window;
  SDL_Renderer * renderer;
  bool active = true;
};


#endif
