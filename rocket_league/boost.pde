class Boost
{
  float x, y, speed, vx, vy, rotation, w;
  int dir, boostTimer;

  Boost(float x, float y, float rotation, int direction)
  {
    this.rotation = rotation;
    this.x = x;
    this.y = y;
    speed = 1;
    dir = direction;
    boostTimer = 0;
    vx = -speed * dir * cos(rotation);
    vy = -speed * dir * sin(rotation);
    
    w = 10;
  }

  void show()
  {
    noStroke();
    fill(#FF0000, 100);
    circle(x+vx, y+vy, w);
  }

  void act()
  {
    x += vx;
    y += vy;
    w+=0.5;
    boostTimer++;
  }
}
