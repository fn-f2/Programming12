class FFloatPlat extends FGameObject
{
  
  FFloatPlat(float x, float y, String n, PImage img)
  {
    super();
    setPosition(x, y);
    setStatic(true);
    setName(n);
    attachImage(img);
  }
  
  void act()
  {
    if (getY() > player.getY()) setSensor(false);
    else setSensor(true);
  }
}
