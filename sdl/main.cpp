#include "App.h"

int main()
{
  App * app = new App;

  if (!app->init()) return 1;

  while (app->is_running())
  {
    app->prepare_scene();

    app->handle_input();

    app->present_scene();

    SDL_Delay(16);
  }

  delete app;

  return 0;
}
