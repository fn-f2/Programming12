class Car
{
  PVector pos;

  int jumps;

  float topspeed;

  boolean isGrounded;

  FPoly hitBox;
  FPoly grnd;

  Car(FPoly ground)
  {
    pos = new PVector(0, 0);

    //topspeed = ;

    hitBox = new FPoly();
    //hitBox.vertex(width/2-50, height/2-50);
    //hitBox.vertex(width/2-50, height/2+50);
    //hitBox.vertex(width/2+50, height/2+50);
    //hitBox.vertex(width/2+50, height/2-50);
    hitBox.vertex(-50, -50);
    hitBox.vertex(-50, +50);
    hitBox.vertex(50, +50);
    hitBox.vertex(50, -50);
    
    hitBox.setGrabbable(false);

    //visuals
    hitBox.setStrokeWeight(0);

    world.add(hitBox);

    grnd = ground;
  }

  void show()
  {
  }

  void act()
  {

    float vx = hitBox.getVelocityX();
    float vy = hitBox.getVelocityY();

    if (wkey && checkGrounded(grnd)) hitBox.setVelocity(vx, -500);
    if (skey) hitBox.addForce(0, -50000);


    if (akey)
    {
      if (checkGrounded(grnd)) hitBox.addForce(-10000, 0);
      else
      {
        hitBox.adjustRotation(radians(2));
      }
    }
    if (dkey)
    {
      if (checkGrounded(grnd)) hitBox.addForce(-10000, 0);
      else
      {
        hitBox.adjustRotation(radians(-2));
      }
    }
  }

  boolean checkGrounded(FPoly ground)
  {
    ArrayList<FContact> contactList = hitBox.getContacts();
    for (int i = 0; i < contactList.size(); i++)
    {
      FContact myContact = contactList.get(i);
      if (myContact.contains(ground))
      {
        return true;
      }
    }
    return false;
  }
}
