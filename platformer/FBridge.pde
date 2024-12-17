class FBridge extends FGameObject
{
  boolean hasTouched = false;

  FBridge(float x, float y)
  {
    super();
    setPosition(x, y);
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
    } else if (hasTouched)
    {
        setStatic(false);
        setSensor(true);
    }
  }
}
