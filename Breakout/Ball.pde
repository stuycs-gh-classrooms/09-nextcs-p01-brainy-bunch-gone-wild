class Ball{
  PVector cxy;
  int xspeed;
  int yspeed;
  int csize;
  color cc;
  
   Ball(PVector p, int s) {
     csize = s;
     cxy = new PVector(p.x, p.y);
     cc = color(10,50,255);
     xspeed = 0;
     yspeed = -1;
   }
   
   void display(){
     fill(cc);
     circle(cxy.x, cxy.y, csize);
   }
   
    void setSpeed(int newx, int newy) {
     xspeed = newx;
     yspeed = newy;
   }
   
   void move() {
    cxy.x+= xspeed;
    cxy.y+= yspeed;
    
    if (cxy.y >= height){
      yspeed = yspeed* (-1);
    }
    
    if (cxy.y <= 0){
      yspeed = yspeed* (-1);
    }
  
    if (cxy.x>=width){
      xspeed = xspeed*-1;
    }
    else if(cxy.x<=0){
      xspeed = xspeed*-1;
    }
  }
}

     
