class Car
{
  PVector pos;

  int jumps;
  int xDir;

  boolean isGrounded;

  FPoly hitBox;
  FPoly grnd;

  Car(FPoly ground)
  {
    pos = new PVector(0, 0);

    jumps = 1;

    hitBox = new FPoly();
    hitBox.vertex(width/2-35, height/2-20);
    hitBox.vertex(width/2-35, height/2+20);
    hitBox.vertex(width/2+35, height/2+20);
    hitBox.vertex(width/2+35, height/2-20);
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
    rotate(hitBox.getRotation());
    fill(#505050);
    rectMode(CENTER);
    rect(width/2+(20*xDir), height/2, 20, 10);
    popMatrix();
  }

  void act()
  {
    float vx = hitBox.getVelocityX();
    float vy = hitBox.getVelocityY();

    hitBox.addForce(0, 2000);

    if (wkey)
    {
      if (checkGrounded(grnd))
      {
        hitBox.adjustPosition(0, -10);
        hitBox.adjustVelocity(0, -500);
      } else if (jumps > 0)
      {
        hitBox.addForce(-170000*cos(hitBox.getRotation()+radians(90)), -170000*sin(hitBox.getRotation()+radians(90)));
      }
      if (jumps > 0) jumps--;
      wkey = false;
    }


    if (skey)
    {
      hitBox.adjustVelocity(27*xDir*cos(hitBox.getRotation()), 27*xDir*sin(hitBox.getRotation()));
    }

    if (akey)
    {
      if (checkGrounded(grnd))
      {
        xDir = -1;
        hitBox.addForce(-17000, 100000);
      } else
      {
        hitBox.setAngularVelocity(-4);
      }
    } else if (!dkey && !checkGrounded(grnd)) hitBox.setAngularVelocity(0);

    if (checkGrounded(grnd))
    {
      hitBox.setAngularVelocity(0);
    }

    if (dkey)
    {
      if (checkGrounded(grnd))
      {
        xDir = 1;
        hitBox.addForce(17000, 100000);
      } else
      {
        hitBox.setAngularVelocity(4);
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
