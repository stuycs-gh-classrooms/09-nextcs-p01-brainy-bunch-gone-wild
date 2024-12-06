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

//CHANGE THIS FUNCTION TO YOUR VERSION I DIDN'T UPDATE IT
  //boolean collisionCheck(Ball other)
  //{
  //  return (this.bxy.dist(other.bxy)
  //    <= (this.csize/2 + other.csize/2) );
  //    return false;
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

  //void generateEffects(Ball other, Paddle p) {
  //  int n = int(random(0, 21));
  //  if (collisionCheck(other)) { //should work when collisionCheck() can be used
  //    if (n == 0) {
  //      other.csize*=2;
  //    } else if (n == 2) {
  //      life += 1;
  //    } else if (n == 3) {
  //      p.size += 10;
  //    } else if (n == 4) {
  //      other.xspeed*=1.5;
  //      other.yspeed*=1.5;
  //    } else if (n == 5) {
  //      Ball[] group = new Ball[2];
  //      for (int i = 0; i<group.length; i++) {
  //        group[i] = new Ball(new PVector(p.x_coord+((p.size/2)*(i+1)), p.y_coord-other.csize/2), other.csize); //the new balls will be placed evenly spaced on the paddle once created
  //        group[i].display();
  //        //!!!ADD THINGS HERE:
  //        //their speeds should set so that they will go off in different directions as soon as they are created
  //      }
  //    }
  //  }
  //}
}
