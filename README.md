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

### One Week Later - Tues 1 October 2024

Working on a system of transition around a level that I could work with easily and simply. It's tough as I'm not that familiar with gdscript, and mostly winging it. Tempted to start in on full game design before this is done, but I need this to be done and working first.

(Later that same night...)

Successfully modelled this with grids of 4x4, 5x5 and 10x10. It all works. The player can 'swipe' around but not go out of the map boundary, and not enter designated squares.

Procedural generation of levels will be possible using this system. Also handmade levels (which is how things will be for the prototype).

### Weds 2 October 2024

Added a new test level to see how it would all work, and it would all work. Added a test enemy and a test Battle UI to see how it would all work, and it would all work. The thing to do now is to design and implement a proper prototype. But is it worth doing?

### Thurs 3 October 2024

Doing something on this every day. Today added core UI elements (basic display of player Location in a 'main ui' node, and a conditional display of a 'battle ui' depending on enemy presence. Toyed with beginnings of room borders. Also implemented a different method of tracking player whereabouts and controlling where can go, etc. This way there are no 'empty cells' in the mapping.

### Fri 4 October 2024

Attempting to add Tilesets as backgrounds for the rooms in the levels, but so far they don't look or feel right. The backgrounds need to be 'full-screen impactful'.

Reflection needed.

### Sat 5 October 2024

Another go at backgrounds, this time with a 256x256 tileset. Results: jank. A rollover again. This will have to be resolved sharpish.

I did spend a few hours today working on design aspects in general. E.g. the Alpha version will be a 4x4 grid. Also, the battle system will be a separate system attached to the movement and environments, etc.

### Sun 6 October

Experimenting with a movement 'jitter'. Not good so far. This whole project needs a hefty kick up the backside.

### Mon 7 October

Aim for today:
- implement the design from Saturday.
- get some type of Alpha-level background(s) into the environments.

Accomplished today's aims, albeit in very first-draft form.

The way to go will be line drawings for me. Tilesets are not going to work. I can use custom sprites for locations and enemies. 

All in all it's starting to remind me of Atic Atac on the Spectrum, circa 1984 or so.

### Tues 8 October

- Get all environments up and running.
- Start work on battle screen and system.

Environments added, albeit barely a working setup. A rough sketch, and I should be much farther along at this stage.

Battle system scene(s) set up - again, though, just an initial setup.

GAME DESIGN needed before anything deeper.

### Weds 9 October

- Tidy up the environments. Improve the 'sketch' at least.
- Add screen jiggle when player tries to move in blocked direction. Add warning message when they try to do it twice. Add exasperated message if they try a third time in a row. "You won't be told again."
- Start proper game design thinking about the battle system.
