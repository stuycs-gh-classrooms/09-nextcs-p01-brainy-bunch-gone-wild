class brick
{
  PVector bxy;
  int xspeed;
  int yspeed;
  int bsize;
  int bcc;
  color bc;
  boolean broken;
  
  brick (PVector xy, int size)
  {
    bxy = xy;
    bsize = size;
    broken = false;
  }
  
  void colorDecider ()
  {
    bcc = int(random(10));
    if (bcc == 0)
    {
      bc = color(255,0,0);
    }
    if (bcc == 1)
    {
      bc = color(255,100,0);
    }
    if (bcc == 2)
    {
      bc = color(255,255,0);
    }
    if (bcc == 3)
    {
      bc = color(0,255,0);
    }
      
      
    }if (bcc == 0)
    {
      bc = (255,0,0);
    }if (bcc == 0)
    {
      bc = (255,0,0);
    }if (bcc == 0)
    {
      bc = (255,0,0);
    }if (bcc == 0)
    {
      bc = (255,0,0);
    }if (bcc == 0)
    {
      bc = (255,0,0);
    }if (bcc == 0)
    {
      bc = (255,0,0);
    }
  }
  
