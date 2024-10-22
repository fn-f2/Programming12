class Car
{
  PVector pos;

  int jumps;

  boolean isGrounded;

  FPoly hitBox;
  FPoly grnd;

  Car(FPoly ground)
  {
    pos = new PVector(0, 0);

    jumps = 2;

    hitBox = new FPoly();
    hitBox.vertex(width/2-50, height/2-30);
    hitBox.vertex(width/2-50, height/2+30);
    hitBox.vertex(width/2+50, height/2+30);
    hitBox.vertex(width/2+50, height/2-30);
    //hitBox.vertex(-50, -50);
    //hitBox.vertex(-50, +50);
    //hitBox.vertex(50, +50);
    //hitBox.vertex(50, -50);

    hitBox.setGrabbable(false);
    hitBox.setRestitution(0);

    //visuals
    hitBox.setStrokeWeight(0);

    world.add(hitBox);

    grnd = ground;
  }

  void show()
  {
    pushMatrix();
    translate(hitBox.getX(), hitBox.getY());
    fill(#505050);
    popMatrix();
  }

  void act()
  {
    println(jumps);
    float vx = hitBox.getVelocityX();
    float vy = hitBox.getVelocityY();

    if (wkey)
    {
      if (checkGrounded(grnd)) hitBox.setVelocity(vx, -500);
    }
    
    if (!checkGrounded(grnd) && wkeyReleased)
    {
        hitBox.adjustVelocity(-600*cos(hitBox.getRotation()+radians(90)), -600*sin(hitBox.getRotation()+radians(90)));
    }
    {
      jumps--;
    }
    if (skey)
    {
      if (sqrt(sq(vx)+sq(vy)) < 700) hitBox.addForce(-40000*cos(hitBox.getRotation()), -40000*sin(hitBox.getRotation()));
    }

    if (akey)
    {
      if (checkGrounded(grnd)) hitBox.addForce(-25000, 100000);
      else
      {
        hitBox.setAngularVelocity(-5);
      }
    } else if (!dkey && !checkGrounded(grnd)) hitBox.setAngularVelocity(0);
    if (dkey)
    {
      if (checkGrounded(grnd)) hitBox.addForce(25000, 100000);
      else
      {
        hitBox.setAngularVelocity(5);
      }
    } else if (!akey && !checkGrounded(grnd)) hitBox.setAngularVelocity(0);

    if (checkGrounded(grnd)) jumps = 2;
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
