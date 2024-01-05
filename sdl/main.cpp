#include <SDL2/SDL.h>

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;


bool running = true;

int main()
{
  SDL_Window * window = NULL;
  SDL_Renderer * renderer = NULL;
  // Initialize SDL
  if (SDL_Init(SDL_INIT_VIDEO) < 0) {
    // Handle initialization error
    return 1;
  }

  // Create window and renderer
  window = SDL_CreateWindow("testing SDL ...", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, 0);
  renderer = SDL_CreateRenderer(window, -1, 0);

  if (!window || !renderer) {
    // Handle window or renderer creation error
    SDL_Quit();
    return 1;
  }

  SDL_Rect * myrect = new SDL_Rect{300, 200, 100, 200};

  while (running) {
    SDL_Event e;
    while (SDL_PollEvent(&e) != 0)
      {
      if (e.type == SDL_QUIT)
	running = false;
      }

    // Render
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
    SDL_RenderClear(renderer);

    SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
    SDL_RenderFillRect(renderer, myrect);

    SDL_RenderPresent(renderer);

    // Delay (optional)
    SDL_Delay(10);
  }

  // Clean up resources
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);

  // Quit SDL subsystems
  SDL_Delay(1000);
  SDL_Quit();

  return 0;
}

