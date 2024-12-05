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
  }

  void colorDecider() {
    bcc = int(random(5)); //randomizes brick colors
    if (bcc == 0) {
      bc = color(255, 100, 100);
    }//red
    else if (bcc == 1) {
      bc = color(255, 255, 100);
    }//yellow
    else if (bcc == 2) {
      bc = color(100, 255, 100);
    }//green
    else if (bcc == 3) {
      bc = color(100, 100, 255);
    }//blue
    else if (bcc == 4) {
      bc = color(255, 100, 255);
    }//purple
    else if (bcc == 5) {
      bc = color(255, 229, 204);
    }//broken|background
  }

  void display() {
    if(!broken){
      fill(bc);
      rect(bxy.x- (bsize/2), bxy.y - (bsize/2), bsize, bsize);
    }
  }

  boolean collisionCheck(Ball other)
  {
    return (this.bxy.dist(other.bxy)
      <= (this.bsize/2 + other.bsize/2) );
  }//collisionCheck()

  boolean mouseBreak(float mx, float my) { //get mouse coordinates
    boolean inRange = false;
    if (mx >= bxy.x && mx <= bxy.x + bsize && my <= bxy.y && my >= bxy.y + bsize) { //checks to see if the mouse is hovering over this brick
      inRange = true;
    }

    if (mousePressed && inRange) {
      return true; //if the mouse is clicking that certain brick return true
    }
    return false;
  }

}
