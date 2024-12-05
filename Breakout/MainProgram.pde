Brick[][] brickwall;
Ball projectile;
Paddle pad;
int bsize = 40;
color c;
int pad_size;
int level;
boolean play;

void setup() {
  background(225, 229, 204);
  level = 1;
  pad_size = 60;

  size(500, 500);
  brickwall = new Brick[5][8];
  pad = new Paddle(pad_size);
  newProjectile(20);
  makeGrid(brickwall);
}

void draw() {
  background(225, 229, 204);
  drawGrid(brickwall);
  pad.display();
  projectile.display();
  keyReleased();
  //more functions here
}

void makeGrid(Brick[][] b) {
  for (int i = 0; i < b.length; i++) { //rows
    for (int j = 0; j < b[i].length; j++) { //columns
      c = color((int(random(255))), (int(random(255))), (int(random(255))));
      float startX = (width - b[0].length * bsize) / 2; //used to center the brickwall
      b[i][j] = new Brick(new PVector(startX + j * bsize+(bsize*2/5), bsize/2+i*bsize), bsize); //order the bricks in the grid
      b[i][j].display();
    }
  }
}

void drawGrid(Brick[][] b) {
  for (int i = 0; i < b.length; i++) { //rows
    for (int j = 0; j < b[i].length; j++) { //columns
      if (b[i][j] != null) {
        b[i][j].display();
      }
    }
  }
}
/*
void checkCollisions(Ball p, Brick[][] b) { //needs the Ball class
 for (int i = 0; i < b.length; i++) {
 for (int j = 0; j < b[i].length; j++) {
 if (b[i][j].collisionCheck(p)) {
 b[i][j] = null; //remove the brick once it is hit
 }
 }
 }
 }*/

void newProjectile(int psize) {
  PVector new_coord = new PVector(width / 2, 440 - psize / 2);
  projectile = new Ball(new_coord, psize);
}

void keyPressed() {
  if (keyCode == UP) { //used to start the game
    play = true;
    projectile.yspeed=-1;
  }

  if (play) {
    if (key == ' ') {
      play = !play;
    } else if (keyCode == LEFT && (pad.x_coord - pad.size / 2)-30 > 0) { //stop the paddle from moving out of the window
      pad.x_coord-=5;
      println("LEFT");
    } else if (keyCode == RIGHT && pad.x_coord + pad.size < width) {
      pad.x_coord+=5;
      println("RIGHT");
    } else if (key == 'r') {
      background(225,229,204);
      level = 1;
      pad_size = 60;
      brickwall = new Brick[5][8];
      pad = new Paddle(pad_size);
      newProjectile(20);
      makeGrid(brickwall);
    }
  }
}

  void keyReleased() {
    if (keyCode == LEFT || keyCode == RIGHT) { //stop the paddle from moving if the left/right keys are not pressed
      pad.x_coord += 0;
    }
  }
