class Bullet extends FCircle
{
  float x, y, v, rotation;

  Bullet(float x, float y, float r)
  {
    super(10);
    this.x = x;
    this.y = y;
    rotation = r;
    v = 3;
    setPosition(x, y);
    //setStatic(true);
    setSensor(true);
    setName("bullet");
    setNoStroke();
    setFillColor(#ff0000);
    //attachImage(fire);
  }

  void show()
  {
  }

  void act()
  {
    x += v*cos(rotation);
    y += v*sin(rotation);
    setPosition(x, y);
  }
  boolean hit()
  {
    ArrayList<FContact> contacts = getContacts();
    if (contacts.size() > 0) return true;
    return false;
  }
}
