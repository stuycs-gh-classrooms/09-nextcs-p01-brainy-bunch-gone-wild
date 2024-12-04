class brick{

  PVector bxy;
  int xspeed;
  int yspeed;
  int bsize;
  int bcc;
  color bc;
  boolean broken;

  brick (PVector xy, int size){
    bxy = xy;
    bsize = size;
    broken = false;
  }

  void colorDecider (){
    bcc = int(random(5)); //randomizes brick colors
    if (bcc == 0){
      bc = color(255, 100, 100);
    }//red
    else if (bcc == 1){
      bc = color(255, 255, 100);
    }//yellow
    else if (bcc == 2){
      bc = color(100, 255,100);
    }//green
    else if (bcc == 3){
      bc = color(100, 100, 255);
    }//blue
    else if (bcc == 4){
      bc = color(255,100,255);
    }//purple
    else if (bcc == 5){
      bc = color(255,229,204);
    }//broken|background

  }
}

  
