class ball{
  PVector cxy;
  int xspeed;
  int yspeed;
  int csize;
  color cc;
  
   ball(PVector p, int s) {
     csize = s;
     cxy = new PVector(p.x, p.y);
     cc = color(10,50,255);
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

     
