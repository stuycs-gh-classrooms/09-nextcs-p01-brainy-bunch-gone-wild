[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/PX83n--N)
# NeXtCS Project 01
### Name0: Miranda Chen (ﾉ◉ω◉)ﾉ*:･ﾟ✧
### Name1: Ryan Chen └[▰ ε ▰]┘
---

### Overview
Your mission is create either:
- Life-like cellular automata [life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life), [life-like](https://en.wikipedia.org/wiki/Life-like_cellular_automaton), [demo](https://www.netlogoweb.org/launch#https://www.netlogoweb.org/assets/modelslib/Sample%20Models/Computer%20Science/Cellular%20Automata/Life.nlogo).
- Breakout/Arkanoid [demo 0](https://elgoog.im/breakout/)  [demo 1](https://www.crazygames.com/game/atari-breakout)
- Space Invaders/Galaga

This project will be completed in phases. The first phase will be to work on this document. Use markdown formatting. For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)


---

## Phase 0: Selection, Analysis & Plan

#### Selected Project: BREAKOUT/ARKANOID

### Necessary Features
What are the core features that your program should have? These should be things that __must__ be implemented in order to make the program useable/playable, not extra features that could be added to make the program more interesting/fun.
- Background Color: (255,229,204)
- Wall of Bricks *(2D Array)*
    - breakable
- Rectangular Paddle/Platform
    - moveable left and right *(using arrow keys)*
- Ball
    - ball moves *(has a x-pos, y-pos, hori-movement, and vert movement)*
    - ball bounces
    - restricts ball from moving out of canvas boundaries 
- Life Counter
    - while life is not 0, keep playing the game
    - goes down when ball passes paddle *(y coord of ball >= paddle)*
    - when reach zero, game ends 
- A way to recover ball when it passes the paddle
- A way to reset the game
- Ability to play/pause game
- After all bricks are broken:
    - bricks will regenerate
    - paddle becomes smaller

### Extra Features
What are some features that are not essential to the program, but you would like to see (provided you have time after completing the necessary features. Theses can be customizations that are not part of the core requirements.

- Some bricks have special rewards for breaking them (randomized using a num generator -> sizes up ball | speeds up ball | +1 life | sizes up paddle| more than 1 ball)

### Array Usage
How will you be using arrays in this project?

1D Array:

1D Array:

    SPECIAL FEATURE: more than 1 ball projectile

2D Array:

    sets the grid of bricks

Controls

How will your program be controlled? List all keyboard commands and mouse interactions.

Keyboard Commands:

    LEFT = moves paddle left
    RIGHT = moves paddle right
    r = resets the game
    SPACE = play/pauses the game

2D Array:
- sets the grid of bricks 


### Controls
How will your program be controlled? List all keyboard commands and mouse interactions.

Keyboard Commands:
- LEFT = moves paddle left
- RIGHT = moves paddle right
- r = resets the game
- SPACE = play/pauses the game

Mouse Control: 
- Mouse movement: *N/a*
- Mouse pressed: changes brick color, and can break bricks if pressed enough


### Classes
What classes will you be creating for this project? Include the instance variables and methods that you believe you will need. You will be required to create at least 2 different classes. If you are going to use classes similar to those we've made for previous assignments, you will have to add new features to them.

CLASS BRICK
- Instance variables:
  - x-coord
  - y-coord
  - size
  - color
  - broken *(boolean)*
- METHODS
  - display
  - processes ball collison
 
CLASS BALL
- Instance variables:
  - x-coord
  - y-coord
  - size
  - color
  - horizontal speed
  - vertical speed
