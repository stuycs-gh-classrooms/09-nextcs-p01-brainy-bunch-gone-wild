Brick[][] brickwall;
Ball projectile;
Paddle pad;
int bsize = 30;
color c;

void setup() {
  size(500,500);
  brickwall = new Brick[5][8];
  pad = new Paddle(bsize*2);
}

void draw() {
  background(225,229,204);
  makeGrid(brickwall);
  pad.display();
  
  //more functions here
}

void makeGrid(Brick[][] b) {
  for (int i = 0; i < b.length; i++) { //rows
    for (int j = 0; j < b[i].length; j++) { //columns
      c = color((int(random(255))),(int(random(255))),(int(random(255))));
      b[i][j] = new Brick(new PVector((j * bsize) + (width/2), (i * bsize) + height/(bsize/5)), bsize, c); //order the bricks in the grid
      b[i][j].display();
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
