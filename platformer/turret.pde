class Turret extends FGameObject
{
  float rotation, x, y;
  ArrayList<Bullet> myBullets;


  Turret(float x, float y)
  {
    super();
    setPosition(x, y);
    setNoStroke();
    setStatic(true);
    setName("turret");
    attachImage(turret);
    myBullets = new ArrayList();
    this.x = x;
    this.y = y;
  }

  void show()
  {
  }

  void act()
  {

    if (player.getX() > getX()) rotation = atan((player.getY()-getY())/(player.getX()-getX()))+radians(270); //rotate
    else rotation = atan((player.getY()-getY())/(player.getX()-getX()))+radians(90);

    setRotation(rotation);

    if (frameCount % 50 == 0)
    {
      Bullet b = new Bullet(x, y, rotation+radians(90));
      myBullets.add(b);
      currentWorld.add(b);
    }

    for (int i = 0; i < myBullets.size(); i++)
    {
      Bullet b = myBullets.get(i);
      b.show();
      b.act();
      if (b.hit() == true)
      {
        currentWorld.remove(b);
        myBullets.remove(i);
      }
    }
  }
}
