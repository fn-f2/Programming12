class Car
{
  PVector pos;
  
  FPoly hitBox;
  
  Car()
  {
    pos = new PVector(0, 0);
    hitBox = new FPoly();
    hitBox.vertex(width/2-50, height/2-50);
    hitBox.vertex(width/2-50, height/2+50);
    hitBox.vertex(width/2+50, height/2+50);
    hitBox.vertex(width/2+50, height/2-50);
    hitBox.setGrabbable(false);
    world.add(hitBox);
  }
  
  void show()
  {
    
  }
  
  void act()
  {
    if (wkey) jump();
    if (skey) hitBox.addForce(0, -50000);
    
    if (akey) hitBox.addTorque(-1000);
    if (dkey) hitBox.addTorque(1000);
    
    println("w");
  }
  
  void jump()
  {
  
  }
}
