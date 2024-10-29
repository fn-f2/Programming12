class Car
{
  PVector pos;

  int jumps;
  int xDir;
  int startX;

  boolean isGrounded;
  boolean canJump = true;

  boolean up, down, left, right;

  FPoly hitBox;
  FPoly ground;
  FCircle ball;

  Car(FPoly grnd, FCircle bll, int strtX)
  {
    ground = grnd;
    ball = bll;
    startX = strtX;

    pos = new PVector(0, 0);

    jumps = 1;

    //if (startX < ball.getX()) xDir = 1;
    //else xDir = -1;

    hitBox = new FPoly();
    hitBox.vertex(startX-35, height/2-20);
    hitBox.vertex(startX-35, height/2+20);
    hitBox.vertex(startX+35, height/2+20);
    hitBox.vertex(startX+35, height/2-20);
    //hitBox.vertex(-50, -50);
    //hitBox.vertex(-50, +50);
    //hitBox.vertex(50, +50);
    //hitBox.vertex(50, -50);

    hitBox.setGrabbable(false);
    hitBox.setRestitution(0);

    //make hitbox invisible
    hitBox.setNoStroke();
    hitBox.setFill(0, 0);

    world.add(hitBox);
  }

  void show()
  {
    pushMatrix();
    translate(hitBox.getX(), hitBox.getY());
    rotate(hitBox.getRotation());
    fill(#505050);
    rectMode(CENTER);
    rect(startX+(20*xDir), height/2, 20, 10);
    fill(#000000);
    circle(startX+25, height/2+15, 20);
    circle(startX-25, height/2+15, 20);
    popMatrix();
  }

  void act()
  {
    isGrounded = checkGrounded(ground);
    
    //extra gravity
    hitBox.addForce(0, 2000);

    if (up && canJump)
    {
      if (isGrounded)
      {
        hitBox.adjustPosition(0, -10);
        hitBox.adjustVelocity(0, -500);
      } else if (jumps > 0)
      {
        hitBox.addForce(-170000*cos(hitBox.getRotation()+radians(90)), -170000*sin(hitBox.getRotation()+radians(90)));
      }
      
      if (jumps > 0) jumps--;
      canJump = false;
    }


    if (down)
    {
      hitBox.adjustVelocity(27*xDir*cos(hitBox.getRotation()), 27*xDir*sin(hitBox.getRotation()));
    }

    if (left)
    {
      if (isGrounded && (abs(degrees(hitBox.getRotation())%360) > 359 || abs(degrees(hitBox.getRotation())%360) < 1))
      {
        xDir = -1;
        hitBox.addForce(-13000, 0);
      } else
      {
        hitBox.setAngularVelocity(-4);
      }
    } else if (!dkey && !isGrounded) hitBox.setAngularVelocity(0);

    if (right)
    {
      if (isGrounded && (abs(degrees(hitBox.getRotation())%360) > 359 || abs(degrees(hitBox.getRotation())%360) < 1))
      {
        xDir = 1;
        hitBox.addForce(13000, 0);
      } else
      {
        hitBox.setAngularVelocity(4);
      }
    } else if (!akey && !isGrounded) hitBox.setAngularVelocity(0);

    if (isGrounded)
    {
      hitBox.setAngularVelocity(0);

      jumps = 2;
      
      //if car rightside up
      if (abs(degrees(hitBox.getRotation())%360) > 330 || abs(degrees(hitBox.getRotation())%360) < 60)
      {
        hitBox.addForce(0, 30000);
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

  void updateKeys(boolean u, boolean d, boolean l, boolean r)
  {
    up = u;
    down = d;
    left = l;
    right = r;
  }
}
