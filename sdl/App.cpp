#include <SDL2/SDL.h>
#include "App.h"

bool App::init()
{
  if (SDL_Init(SDL_INIT_EVERYTHING) < 0) return false;
  else 
  {
    window = SDL_CreateWindow("test", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, WIN_X, WIN_Y, SDL_WINDOW_FULLSCREEN);
    if (!window) return false;
    else 
    {
      renderer = SDL_CreateRenderer(window, -1, 0);
      if (!renderer) return false;
    }
  }
  return true;
}


void App::prepare_scene()
{
  SDL_SetRenderDrawColor(renderer, 60, 60, 60, 150);
  SDL_RenderClear(renderer);
}


void App::handle_input()
{
  SDL_Event event;
  while (SDL_PollEvent(&event))
  {
    switch (event.type)
    {
      case SDL_QUIT:
        is_running = false;
        break;
      default:
        break;
    }
  }
}


void App::present_scene()
{
  SDL_RenderPresent(renderer);
}

