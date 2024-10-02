# Scrolling Adventure

A traditional turn-based RPG that utilises touchscreen and scrolling to move around a world.

The object is to find the Object. It is hidden somewhere in the world. Travel the world to find clues. Find the Object. Nothing else matters.

Battle enemies and recruit allies.

Currently working on the most basic aspect: the swipe-and-scroll mechanic that will move the game and player in the world.

Might be a sci-fi world, might be fantasy, will probably have elements of both.

### Day 2

Some progress on the animations of moving from room to room of the game world. Stuck on how to map the game world to code and check for allowed moves without making a complicated code structure that would take more effort and time to maintain accurately that none of this would really be worth doing.

Tweens are the answer for the animation. Now how to check for legal moves?

Mapping to multi-dimensional arrays is possible, but too fiddly.

Will be looking at a graphical option. I.e. the game only allows movement in a direction if the way is not obstructed.

### One Week Later

Working on a system of transition around a level that I could work with easily and simply. It's tough as I'm not that familiar with gdscript, and mostly winging it. Tempted to start in on full game design before this is done, but I need this to be done and working first.

(Later that same night...)

Successfully modelled this with grids of 4x4, 5x5 and 10x10. It all works. The player can 'swipe' around but not go out of the map boundary, and not enter designated squares.

Procedural generation of levels will be possible using this system. Also handmade levels (which is how things will be for the prototype).


