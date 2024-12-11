class Paddle {
  float x_coord, y_coord;
  int size; //width of paddle
  
  Paddle(int s) {
    this.size = s;
    this.x_coord = mouseX;
    this.y_coord = 450;
  }

  void move (){
    x_coord = mouseX;
  }
  
  boolean collisionCheck(Ball other){
    if (other.cxy.y + other.csize >= this.y_coord){
      if((other.cxy.x >= this.x_coord - size) && (other.cxy.x <= this.x_coord + size)){
          return true;
      }
    }
    return false;
  }

  void display() {
    fill(255,153,51);
    rect(x_coord - size, 440, size*2, 10);
  }
}
