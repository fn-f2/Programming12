class Car
{
  float x, y;
  float speed;
  float steerAngle;
  float maxAngle;
  float straightAngle;

  Car()
  {
    x = width/2;
    y = height/2;
    speed = 8;
    steerAngle = radians(270);
    maxAngle = radians(20);
    straightAngle = radians(270);
  }

  void show()
  {
    pushMatrix();
    translate(x, y);
    pushMatrix();
    if (steerAngle > TWO_PI) steerAngle = 0;
    if (steerAngle < 0) steerAngle = TWO_PI;
    rotate(steerAngle);
    fill(#ffffff);
    square(0, 0, 100);
    popMatrix();
    fill(#000000);
    textSize(20);
    text(degrees(steerAngle), 0, 0);
    popMatrix();
  }

  void act(boolean fwd, boolean left, boolean back, boolean right)
  {
    if (fwd)
    {
      //y+=speed*sin(angle);
      //x+=speed*cos(angle);
      if (y > 50) y -= speed;
    }

    if (left)
    {
      if (steerAngle > straightAngle-maxAngle && steerAngle < straightAngle+radians(60)) steerAngle-=radians(3);
      x -= speed;
    } else if (steerAngle < straightAngle) steerAngle += radians(3);

    if (back)
    {
      //y-=speed*sin(angle);
      //x-=speed*cos(angle);
      if (y < height-50)y += speed;
    }

    if (right)
    {
      if (steerAngle > straightAngle-radians(60) && steerAngle < straightAngle+maxAngle) steerAngle+=radians(3);
      x += speed;
    } else if (steerAngle > straightAngle) steerAngle -= radians(3);

    if (left && right)
    {
      if (steerAngle < straightAngle) steerAngle += radians(3);
      if (steerAngle > straightAngle) steerAngle -= radians(3);
    }
  }
}
