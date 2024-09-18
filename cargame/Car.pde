class Car
{
  float x, y, rotation;  float speed = 6;
  float angle;

  Car()
  {
    x = width/2;
    y = height/2;
  }

  void show()
  {
    pushMatrix();    
    translate(x, y);
    rotate(angle);
    square(0, 0, 50);
    popMatrix();
  }

  void act(boolean fwd, boolean left, boolean back, boolean right)
  {
    if (fwd)
    {
      y+=speed*sin(angle);
      x+=speed*cos(angle);
    }
    if (left)
    {
      angle-=radians(5);
    }
    if (back)
    {
      y-=speed*sin(angle);
      x-=speed*cos(angle);
    }
    if (right)
    {
      angle+=radians(5);
    }
  }
}
