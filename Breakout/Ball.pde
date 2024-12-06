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
   
   void move(){
     cxy.x+= xspeed;
     cxy.y+= yspeed;
   }
}

     
