class FBridge extends FBox
{
  FBridge(float x, float y)
  {
    super(gridSize, gridSize);
    setPosition(x, y);
    attachImage(bridge);
    setStatic(true);
    setFriction(4);
  }

  void act()
  {
    checkForCollisions();
  }
  
  void checkForCollisions()
  {
  
  }
}
