#include <SDL2/SDL.h>

const int WIN_X = 1920;
const int WIN_Y = 1080;

typedef struct 
{
  SDL_Window * window;
  SDL_Renderer * renderer;
  bool is_running;
} App;
App * app = new App;


bool init();
void prepare_scene();
void handle_input();
void present_scene();
void clean();

int main()
{
  if (!init()) return 1;

  while (app->is_running)
  {
    prepare_scene();

    handle_input();

    present_scene();

    SDL_Delay(16);
  }

  clean();

  return 0;
}

bool init()
{
  if (SDL_Init(SDL_INIT_EVERYTHING) < 0) return false;
  else 
  {
    app->window = SDL_CreateWindow("test", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, WIN_X, WIN_Y, SDL_WINDOW_FULLSCREEN);
    if (!app->window) return false;
    else 
    {
      app->renderer = SDL_CreateRenderer(app->window, -1, 0);
      if (!app->renderer) return false;
    }
  }
  return true;
}
void prepare_scene()
{
  SDL_SetRenderDrawColor(app->renderer, 60, 60, 60, 150);
  SDL_RenderClear(app->renderer);
}
void handle_input()
{
  SDL_Event event;
  while (SDL_PollEvent(&event))
  {
    switch (event.type)
    {
      case SDL_QUIT:
        app->is_running = false;
        break;
      default:
        break;
    }
  }
}
void present_scene()
{
  SDL_RenderPresent(app->renderer);
}

void clean()
{
  delete app;
}
