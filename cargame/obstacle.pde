class Obstacle
{
  int type;
  final int small = 0;
  final int medium = 1;
  final int large = 2;

  int lane;

  float x, y, h;

  Obstacle()
  {
    type = floor(random(0, 3));

    lane = coinFlip();

    if (lane==0) x = 385;
    else x = 615;
    if (type==small) h = 100;
    else if (type==medium) h = 200;
    else if (type==large) h = 400;
    y = -h/2;
  }

  void show()
  {
    if (type==small)
    {
      fill(#ffffff);
      rect(x, y, 100, h);
    } else if (type==medium)
    {
      fill(#ffffff);
      rect(x, y, 100, h);
    } else if (type==large)
    {
      fill(#ffffff);
      rect(x, y, 100, h);
    }
  }

  void act()
  {
    if (!gameover) y+=4;
  }
}
