class Brick {
  PVector bxy;
  int bsize;
  int bcc;
  color bc;
  boolean broken;

  Brick(PVector xy, int size) {
    bxy = xy;
    bsize = size;
    broken = false;
    colorDecider();
  }

  void colorDecider() {
    bcc = int(random(6));
    if (bcc == 0) {
      bc = color(255, 100, 100);
    } else if (bcc == 1) {
      bc = color(255, 255, 100);
    } else if (bcc == 2) {
      bc = color(100, 255, 100);
    } else if (bcc == 3) {
      bc = color(100, 100, 255);
    } else if (bcc == 4) {
      bc = color(255, 100, 255);
    } else if (bcc == 5) {
      bc = color(255, 229, 204);
    }
  }

  void display() {
    if (!broken) {
      fill(bc);
      rect(bxy.x - (bsize / 2), bxy.y - (bsize / 2), bsize, bsize);
    }
  }

  void makeGrid(Brick[][] b) {
    for (int i = 0; i < b.length; i++) {
      for (int j = 0; j < b[i].length; j++) {
        float startX = (width - b[0].length * bsize) / 2;
        b[i][j] = new Brick(new PVector(startX + j * bsize + (bsize * 2 / 5), bsize / 2 + i * bsize), bsize);
        b[i][j].display();
      }
    }
  }

  //boolean collisionCheck(Ball other)
  //{
  //  return (this.bxy.dist(other.bxy)
  //    <= (this.bsize/2 + other.bsize/2) );
  //}//collisionCheck()

  boolean mouseBreak(float mx, float my) { //get mouse coordinates
    boolean inRange = false;
    if (mx >= bxy.x && mx <= bxy.x + bsize && my <= bxy.y && my >= bxy.y + bsize) { //checks to see if the mouse is hovering over this brick
      inRange = true;
    }

    if (mousePressed && inRange) {
      return true; //if the mouse is clicking that certain brick return true
    } //there will be a function in the main program where it checks how many times this function returns true so that when the brick is clicked a certain amount of times it will break
    return false;
  }
}
