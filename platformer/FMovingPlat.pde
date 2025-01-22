class FMovingPlat extends FGameObject
{
  int direction = R;
  int speed = 2;
  int type = 2;
  float x, y;

  FMovingPlat(float x, float y)
  {
    super();
    setPosition(x, y);
    setFriction(100);
    setStatic(true);
    this.x = x;
    this.y = y;

    setName("movingplat");
    setFillColor(#0000ff);
    setNoStroke();
    setRotatable(false);
  }

  void act()
  {
    collide();
    move();
  }

  void collide()
  {
    if (isTouching("wall"))
    {
      direction *= -1;
      if (type == 1) setPosition(getX()+direction, getY());
      else if (type == 2) setPosition(getX(), getY()+direction);
    }
  }

  void move()
  {
    if (type == 1) x += speed*direction;
    else if (type == 2) y += speed*direction;
    setPosition(x, y);
  }
}
