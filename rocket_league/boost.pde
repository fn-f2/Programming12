class Boost
{
  float xi, yi, x, y, speed, vx, vy;
  int dir, boostTimer;

  Boost(float x, float y, float rotation, int direction)
  {
    xi = x;
    yi = y;
    this.x = x;
    this.y = y;
    speed = 2;
    dir = direction;
    boostTimer = 0;
    vx = -speed * dir * cos(rotation);
    vy = -speed * dir * sin(rotation);
  }

  void show(float rotation, float xi, float yi, float direc)
  {
    noStroke();
    fill(#000000, 100);
    pushMatrix();
    translate(x, y);
    rotate(rotation);
    circle(xi-40*direc, yi, 40);
    popMatrix();
  }

  void act()
  {
    x += vx;
    y += vy;

    boostTimer++;
  }

  boolean checkDist()
  {
    if (dist(xi, yi, x, y) > 100)
    {
      return true;
    } else return false;
  }
}
