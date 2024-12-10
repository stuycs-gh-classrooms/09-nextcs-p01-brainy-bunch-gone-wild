Brick[][] brickwall;
Ball projectile;
Paddle pad;
int bsize = 40;
color c;
int pad_size;
int level;
boolean play;
int time1;
int time2;
int life;
int[][] n;

void setup() {
  background(255, 229, 204);
  level = 1;
  pad_size = 60;
  time1 = 0;
  life = 5;

  frameRate(240);

  size(500, 500);
  brickwall = new Brick[5][8];
  pad = new Paddle(pad_size);
  newProjectile(20);
  strokeWeight(2);
  makeGrid(brickwall);
}

void draw() {
  background(225, 229, 204);
  strokeWeight(2);
  drawGrid(brickwall);
  pad.display();
  projectile.display();
  keyReleased();
  checkCollisions(projectile, brickwall);
  paddleBounce(pad, projectile);
  checkBound();
  textSize(25);
  fill(0, 0, 255);
  textAlign(RIGHT, BOTTOM);
  text("Life: " + life, 490, 490);

  if (play) {
    projectile.move();
  }//when UP is pressed, games starts and begins moving projectile

  time1 +=1;

  if (time1 <= 200) {
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(30);
    text("UP Arrow To Start Game", width/2, height-15); //text appears for some time and then disappears
  }

  implement(brickwall);
  time2 +=1;
}

void makeGrid(Brick[][] b) {
  n = new int[b.length][8];

  for (int i = 0; i < b.length; i++) { //rows
    for (int j = 0; j < b[i].length; j++) { //columns
      c = color((int(random(255))), (int(random(255))), (int(random(255))));
      float startX = (width - b[0].length * bsize) / 2; //used to center the brickwall
      b[i][j] = new Brick(new PVector(startX + j * bsize+(bsize*2/5), bsize/2+i*bsize), bsize); //order the bricks in the grid
      b[i][j].display();
    }
  }

  for (int r = 0; r < b.length; r++) { //rows
    for (int c = 0; c < 8; c++) { //columns
      n[r][c] = int(random(0, 16)); //assign random effect to each brick
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

void checkCollisions(Ball p, Brick[][] b) { //needs the Ball class
  for (int i = 0; i < b.length; i++) {
    for (int j = 0; j < b[i].length; j++) {
      if (b[i][j].collisionCheck(projectile) && !b[i][j].broken) {
        b[i][j].broken = true;
        b[i][j].generateEffects(projectile, pad, n[i][j]);
        time2 = 0;
        p.yspeed = p.yspeed * -1;
        if (p.xspeed == -1) {
          p.xspeed = 1;
        } else if (p.xspeed == 1) {
          p.xspeed = -1;
        }
      }
    }
  }
}

void paddleBounce (Paddle p, Ball b) {
  if (p.collisionCheck(b)) {
    b.yspeed = b.yspeed * -1;
    if (b.cxy.x>=(p.x_coord-p.size) || b.cxy.x<(p.x_coord)) {
      b.xspeed = -1;
    } else if (b.cxy.x>=(p.x_coord) || b.cxy.x<(p.x_coord+p.size)) {
      b.xspeed = 1;
    }
  }
}

void newProjectile(int psize) {
  PVector new_coord = new PVector(width / 2, 435 - psize / 2);
  projectile = new Ball(new_coord, psize);
}

void keyPressed() {
  if (keyCode == UP) { //used to start the game
    play = true;
  }

  if (key == ' ') {
    play = !play;
  }

  if (play) {
    if (keyCode == LEFT && (pad.x_coord - pad.size / 2)-30 > 0) { //stop the paddle from moving out of the window
      pad.x_coord-=5;
    } else if (keyCode == RIGHT && pad.x_coord + pad.size < width) {
      pad.x_coord+=5;
    } else if (key == 'r') {
      gameReset();
    }
  }
}

void keyReleased() {
  if (keyCode == LEFT || keyCode == RIGHT) { //stop the paddle from moving if the left/right keys are not pressed
    pad.x_coord += 0;
  }
}

void roundReset() {
  newProjectile(20);
  pad = new Paddle(pad_size);
}

void gameReset() {
  background(225, 229, 204);
  level = 1;
  pad_size = 60;
  brickwall = new Brick[5][8];
  pad = new Paddle(pad_size);
  newProjectile(20);
  makeGrid(brickwall);
}

void checkBound() {
  if (projectile.cxy.y > pad.y_coord+10) { //if the ball goes past the paddle, round resets and lose a life
    play = false;
    roundReset();
    life -= 1;
  }

  if (life <= 0) {
    play = false;
    background(255, 229, 204);
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    text("Game Over", 250, 250);
  }
}

void implement(Brick[][] b) {
  for (int i = 0; i < b.length; i++) {
    for (int j = 0; j < b[i].length; j++) {
      if (b[i][j].active) {
        //if the current special effect is active, don't apply any more of that effect
      }
    }
  }

  if (time2 >= 1200) {
    resetEffects(b);
    time2 = 0;
  }
}

void resetEffects(Brick[][] b) {
  projectile.csize = 20;
  projectile.xspeed = -1;
  projectile.yspeed = -1;
  pad.size = pad_size;

  for (int i = 0; i < b.length; i++) {
    for (int j = 0; j < b[i].length; j++) {
      b[i][j].active = false;
    }
  }
}
