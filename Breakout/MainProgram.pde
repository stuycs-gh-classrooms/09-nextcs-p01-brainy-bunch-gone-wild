Brick[][] brickwall;
Ball projectile;
int bsize = 30;

void setup() {
  size(500,500);
  brickwall = new Brick[8][5];
  newProjectile(20); //will be used once Ball class is created
}

void draw() {
  background(225,229,204);
  makeGrid(brickwall);
  checkCollisions(projectile,brickwall);
  //more functions here
}

void makeGrid(Brick[][] b) {
  for (int i = 0; i < b.length; i++) { //rows
    for (int j = 0; j < b[i].length; j++) { //columns
      b[i][j] = new Brick(new PVector(j * bsize + bsize / 2, i * bsize + bsize / 2), bsize); //order the bricks in the grid
      b[i][j].display();
    }
  }
}

void checkCollisions(Ball p, Brick[][] b) { //needs the Ball class
  for (int i = 0; i < b.length; i++) {
    for (int j = 0; j < b[i].length; j++) {
      if (b[i][j].collisionCheck(p)) {
        b[i][j] = null; //remove the brick once it is hit
      }
    }
  }
}
