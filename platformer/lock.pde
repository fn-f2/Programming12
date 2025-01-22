class Lock extends FGameObject
{
  float x, y;
  boolean hasTouched = false;
  int timer;

  Lock(float x, float y, PImage img)
  {
    super();

    timer = 0;

    setPosition(x, y);
    setRotatable(false);
    setRestitution(0);
    setName("lock");
    attachImage(img);
    setStatic(true);
    setFriction(4);
    
    this.x = x;
    this.y = y;
  }

  void act()
  {
    if (unlocked) currentWorld.remove(this);
  }
}
