#include <iostream>
#include <SFML/Audio.hpp>
#include <SFML/Graphics.hpp>
#include "need.h"

int main()
{
  // Create the main window
  sf::RenderWindow window(sf::VideoMode(1920, 1080), "SFML window");

  // Load a sprite to display
  sf::Texture texture;
  if (!texture.loadFromFile("cute_image.jpeg"))
    return EXIT_FAILURE;
  sf::Sprite sprite(texture);
  sprite.setScale(6, 6);

  /* // Load a music to play */
  /* sf::Music music; */
  /* if (!music.openFromFile("nice_music.ogg")) */
  /*     return EXIT_FAILURE; */
  /**/
  /* // Play the music */
  /* music.play(); */

  // Start the game loop
  while (window.isOpen())
  {
    // Process events
    sf::Event event;
    while (window.pollEvent(event))
    {
      // Close window: exit
      if (event.type == sf::Event::Closed)
        window.close();
    }
 
        // Clear screen
        window.clear();
 
        // Draw the sprite
        window.draw(sprite);
 
        // Update the window
        window.display();
    }
 
    return EXIT_SUCCESS;
}
