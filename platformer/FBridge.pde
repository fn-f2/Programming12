class FBridge extends FGameObject
{
  boolean hasTouched = false;
  int timer;

  FBridge(float x, float y)
  {
    super();

    timer = 0;

    setPosition(x, y);
    setRotatable(false);
    setRestitution(0);
    setName("bridge");
    attachImage(bridge);
    setStatic(true);
    setFriction(4);
  }

  void act()
  {
    if (isTouching("player"))
    {
      hasTouched = true;
    }
    if (hasTouched)
    {
      timer++;
      if (timer > 20)
      {
        setStatic(false);
        setSensor(true);
      }
    }
  }
}
