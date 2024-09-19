class Car
{
  float x, y;
  float speed;
  float angle;
  float maxAngle;
  float straightAngle;

  Car()
  {
    x = width/2;
    y = height/2;
    speed = 6;
    angle = radians(270);
    maxAngle = radians(30);
    straightAngle = radians(270);
  }

  void show()
  {
    pushMatrix();
    translate(x, y);
    pushMatrix();
    if (angle > TWO_PI) angle = 0;
    if (angle < 0) angle = TWO_PI;
    rotate(angle);
    fill(#ffffff);
    square(0, 0, 50);
    popMatrix();
    fill(#000000);
    text(degrees(angle), 0, 0);
    popMatrix();
  }

  void act(boolean fwd, boolean left, boolean back, boolean right)
  {
    if (fwd)
    {
      //y+=speed*sin(angle);
      //x+=speed*cos(angle);
      if (y > 25) y -= speed;
    }

    if (left)
    {
      if (angle > straightAngle-maxAngle && angle < straightAngle+radians(60)) angle-=radians(5);
      x -= speed;
    } else if (angle < straightAngle) angle += radians(5);

    if (back)
    {
      //y-=speed*sin(angle);
      //x-=speed*cos(angle);
      if (y < height-25)y += speed;
    }

    if (right)
    {
      if (angle > straightAngle-radians(60) && angle < straightAngle+maxAngle) angle+=radians(5);
      x += speed;
    } else if (angle > straightAngle) angle -= radians(5);

    if (left && right)
    {
      if (angle < straightAngle) angle += radians(5);
      if (angle > straightAngle) angle -= radians(5);
    }
  }
}
