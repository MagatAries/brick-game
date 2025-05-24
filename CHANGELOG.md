# Changelog

## [main] - 2024-05-20
- Core Pong logic ported to Breakout base
- Ball/paddle movement working
- Wall collisions bounce correctly


## [feature/brick-collision] - 2024-05-21
- Added brick scene as Area2D with signal handling
- Implemented directional bounce on hit (x/y axis flip)
- Bricks are destroyed on collision
- Tweaked ball speed to prevent tunneling
- changed speed -> issues pertaining ball being clipped through outer walls "is_in_Narnia"
- changed starting linear velocity -> sometimes would start at x velocity of 0.0 and y velocity of 0.0 
- added panel movement left and right
- reduced gravity to 0.0
