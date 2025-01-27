class GameObject
{
  PVector loc;
  float size;
  int lives;
  
  //default
  GameObject(float x, float y, float z, float s)
  {
    lives = 1;
    loc = new PVector(x, y, z);
    size = s;
  }
  
  void act()
  {
  
  }
  
  void show()
  {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(white);
    world.box(size);
    world.popMatrix();
  }
}
