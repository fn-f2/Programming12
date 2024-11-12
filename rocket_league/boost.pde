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
    vx = -random(speed-.7, speed+.7) * dir * cos(rotation);
    vy = -random(speed-.7, speed+.7) * dir * sin(rotation);

    w = 15;
  }

  void show()
  {
    noStroke();
    if (boostTimer < 20)
    {
      fill(#C8722B, 150);
      circle(x, y, w);
      //circle(x+random(-10, 10), y+random(-10, 10), w);
      //circle(x+random(-10, 10), y+random(-10, 10), w);
    } else fill(#505050, 100);
    {
      circle(x, y, w);
    }
  }
  void act()
  {
    x += vx;
    y += vy;
    w+=0;//.5;
    boostTimer++;
  }
}
