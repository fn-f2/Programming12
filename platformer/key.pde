class Key extends FGameObject
{
  float x, y, maxy, miny;
  int direction;

  Key(float x, float y)
  {
    super();

    setPosition(x, y);
    setRotatable(false);
    setRestitution(0);
    setName("key");
    attachImage(keyimg);
    setSensor(true);
    setStatic(true);
    setFriction(4);
    
    this.x = x;
    this.y = y;
    
    maxy = y+2;
    miny = y-2;
    
    direction = -1;
  }

  void act()
  {
    animate();
    if (isTouching("player"))
    {
      currentWorld.remove(this);
      unlocked = true;
    }
  }
  
  void animate()
  {
    if (y > maxy || y < miny) direction *= -1;
    setPosition(x, y);
    y += 0.1 * direction;
  }
}
