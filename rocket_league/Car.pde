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

    jumps = 1;

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
  }

  void act()
  {
    float vx = hitBox.getVelocityX();
    float vy = hitBox.getVelocityY();

    if (wkey)
    {
      if (checkGrounded(grnd))
      {
        hitBox.adjustPosition(0, -10);
        hitBox.adjustVelocity(0, -500);
      } else if (jumps > 0)
      {
        hitBox.addForce(-400000*cos(hitBox.getRotation()+radians(90)), -400000*sin(hitBox.getRotation()+radians(90)));
      }
      if (jumps > 0) jumps--;
      wkey = false;
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

    if (checkGrounded(grnd))
    {
      hitBox.setAngularVelocity(0);
    }

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
