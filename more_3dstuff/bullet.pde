class Bullet extends GameObject
{
  PVector dir;
  float speed;

  Bullet()
  {
    super(eyeX, eyeY, eyeZ, 10);
    speed = 20;
    float vx = cos(LRHeadAngle);
    float vy = tan(UDHeadAngle);
    float vz = sin(LRHeadAngle);
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
  }

  void act()
  {
    int hitx = int(loc.x+2000-gridSize)/gridSize;
    int hity = int(loc.z+2000-gridSize)/gridSize;
    if (map.get(hitx, hity) == white)
    {
      loc.add(dir);
    } else
    {
      for (int i = 0; i < 5; i++)
      {
        lives = 0;
      }
    }

    loc.x += speed*cos(LRHeadAngle);
    loc.y += speed*tan(UDHeadAngle);
    loc.z += speed*sin(LRHeadAngle);
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
