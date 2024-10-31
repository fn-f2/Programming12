class Car
{
  PVector pos;

  int jumps;
  int xDir;
  int startX;

  boolean isGrounded;
  boolean canJump = true;

  boolean up, down, left, right;

  color teamCol;

  FPoly hitBox;
  FPoly ground;

  Car(FPoly grnd, FCircle ball, int strtX, color col)
  {
    ground = grnd;
    startX = strtX;
    teamCol = col;

    pos = new PVector(0, 0);

    jumps = 1;

    if (startX < ball.getX()) xDir = 1;
    else xDir = -1;

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
    noStroke();
    fill(teamCol);
    rectMode(CENTER);
    triangle(startX+20*xDir, height/2, startX, height/2, startX, height/2-20);
    rect(startX+20*xDir, height/2, 20, 10);
    fill(0);
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
      jumps--;
      if (isGrounded) //ground jump
      {
        hitBox.adjustPosition(0, -10);
        hitBox.adjustVelocity(0, -500);
      } else if (jumps >= 0) //air jump
      {
        hitBox.addForce(-170000*cos(hitBox.getRotation()+radians(90)), -170000*sin(hitBox.getRotation()+radians(90)));
      }

      canJump = false;
    }
    
    if (jumps < 0) jumps = 0;


    if (down)
    {
      hitBox.adjustVelocity(27*xDir*cos(hitBox.getRotation()), 27*xDir*sin(hitBox.getRotation()));
    }

    if (left)
    {
      if (isGrounded && (abs(degrees(hitBox.getRotation())%360) > 359 || abs(degrees(hitBox.getRotation())%360) < 1))
      {
        xDir = -1;
        hitBox.addForce(-10000, 0);
      } else
      {
        hitBox.setAngularVelocity(-4);
      }
    } else if (!right && !isGrounded) hitBox.setAngularVelocity(0);

    if (right)
    {
      if (isGrounded && (abs(degrees(hitBox.getRotation())%360) > 359 || abs(degrees(hitBox.getRotation())%360) < 1))
      {
        xDir = 1;
        hitBox.addForce(10000, 0);
      } else
      {
        hitBox.setAngularVelocity(4);
      }
    } else if (!left && !isGrounded) hitBox.setAngularVelocity(0);

    isGrounded = checkGrounded(ground);


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
