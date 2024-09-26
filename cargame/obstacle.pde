class Obstacle
{
  int type;
  final int small = 0;
  final int medium = 1;
  final int large = 2;

  int lane;

  float x, y;

  Obstacle()
  {
    type = floor(random(0, 3));

    lane = coinFlip();

    if (lane==0) x = 400;
    else x = 600;
    y = -150;
  }

  void show()
  {
    if (type==small)
    {
      fill(#ffffff);
      rect(x, y, 100, 100);
    } else if (type==medium)
    {
      fill(#ffffff);
      rect(x, y, 100, 100);
    } else if (type==large)
    {
      fill(#ffffff);
      rect(x, y, 100, 100);
    }
  }

  void act()
  {
    y+=4;
  }
}
