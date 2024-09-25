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
