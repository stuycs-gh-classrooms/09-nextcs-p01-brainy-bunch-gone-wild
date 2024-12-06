class Paddle {
  float x_coord, y_coord;
  int size; //width of paddle
  
  Paddle(int s) {
    this.size = s;
    this.x_coord = width/2;
    this.y_coord = 450;
  }
  
  void display() {
    fill(255,153,51);
    rect(x_coord - size, 440, size*2, 10);
  }
}
