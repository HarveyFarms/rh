#include <SDL2/SDL.h>

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;

int main()
{
  SDL_Window * window = NULL;
  SDL_Renderer * renderer = NULL;

  if (SDL_Init(SDL_INIT_VIDEO) < 0)
    {
      return 1;
    }

  window = SDL_CreateWindow("only a few seconds ...", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, 0);

  renderer = SDL_CreateRenderer(window, -1, 0);

  if (!window || !renderer)
    {
      SDL_Quit();
      return 1;
    }

  SDL_Delay(3000);
  SDL_Quit();

  return 0;
}
