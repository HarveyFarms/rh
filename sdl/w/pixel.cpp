#include <SDL2/SDL.h>

int main()
{
    SDL_Window* window = nullptr;
    SDL_Renderer* renderer = nullptr;

    // Initialize SDL
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        // Handle initialization error
        return 1;
    }

    // Create window and renderer
    window = SDL_CreateWindow("SDL Example", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, 0);
    renderer = SDL_CreateRenderer(window, -1, 0);

    if (!window || !renderer) {
        // Handle window or renderer creation error
        SDL_Quit();
        return 1;
    }

    bool running = true;
    while (running) {
        SDL_Event e;
        while (SDL_PollEvent(&e) != 0) {
            if (e.type == SDL_QUIT)
                running = false;
        }

        // Render
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
        SDL_RenderClear(renderer);

        SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
        SDL_RenderDrawPoint(renderer, 640 / 2, 480 / 2);

        SDL_RenderPresent(renderer);

        // Delay (optional)
        SDL_Delay(10);
    }

    // Clean up resources
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);

    // Quit SDL subsystems
    SDL_Quit();

    return 0;
}
