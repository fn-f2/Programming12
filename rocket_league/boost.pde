class Boost
{
  float xi, yi, x, y, speed, vx, vy;
  int dir;
  
  Boost(float x, float y, float rotation, int direction)
  {
    xi = x;
    yi = y;
    this.x = x;
    this.y = y;
    speed = 2;
    dir = direction;
    vx = -speed * dir * cos(rotation);
    vy = -speed * dir * sin(rotation);
  }
  
  void show(float rotation, float xi, float direc)
  {
    noStroke();
    fill(#000000, 100);
    pushMatrix();
    circle(x, y, 20);
    popMatrix();
  }
  
  void act()
  {
    x += vx;
    y += vy;
  }
  
  boolean checkDist()
  {
   if (dist(xi, yi, x, y) > 100)
   {
     return true;
   } else return false;
  }
}
