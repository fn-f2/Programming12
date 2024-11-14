class Car
{
  PVector pos;

  int jumps;
  int xDir;
  int startX, startY;

  boolean isGrounded;
  boolean canJump = true;
  boolean hasSetDir;

  boolean up, down, left, right;

  color teamCol;

  ArrayList<Boost> myBoost;

  FPoly hitBox;
  FPoly ground;

  Car(FPoly grnd, FCircle ball, int strtX, color col)
  {
    ground = grnd;
    startX = strtX;
    startY = int(height*0.9+19.5);
    teamCol = col;

    myBoost = new ArrayList();

    pos = new PVector(0, 0);

    jumps = 1;

    if (startX < ball.getX()) xDir = 1;
    else xDir = -1;

    hitBox = new FPoly();
    hitBox.vertex(-35, 0-20);
    hitBox.vertex(-35, 20);
    hitBox.vertex(35, 20);
    hitBox.vertex(35, -20);
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

    hitBox.setPosition(startX, startY);
  }

  void show()
  {
    pushMatrix();
    translate(hitBox.getX(), hitBox.getY());
    rotate(hitBox.getRotation());
    noStroke();
    rectMode(CENTER);
    fill(#202020);
    quad(-27*xDir, 0, -37*xDir, -10, -44*xDir, -10, -37*xDir, 0);
    fill(teamCol);
    quad(45*xDir, 10, 40*xDir, 19, 20*xDir, 19, 20*xDir, -1);
    fill(#000000);
    triangle(20*xDir, 0, 0, 0, 0, -19);
    fill(teamCol);
    rect(-10*xDir, -1, 21, 35);
    rect(10*xDir, 8, 21, 17.5);
    quad(-40*xDir, 0, -40*xDir, 20, -20*xDir, 20, -20*xDir, -10);
    //fill(#505050);
    //rect(-40*xDir, -11, 20, 10);
    triangle(-47*xDir, -8, -47*xDir, -22, -28*xDir, -8);
    fill(0);
    circle(25, 15, 20);
    circle(-25, 15, 20);
    stroke(#505050);
    strokeWeight(5);
    strokeCap(SQUARE);
    arc(25, 15, 20, 20, -PI, 0);
    arc(-25, 15, 20, 20, -PI, 0);
    noStroke();
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
      myBoost.add(new Boost(hitBox.getX(), hitBox.getY(), hitBox.getRotation(), xDir));
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
      if (!hasSetDir)
      {
        if (abs(degrees(hitBox.getRotation())%360) > 360) xDir = -1;
        else xDir = 1;
        hitBox.setPosition(hitBox.getX(), startY);
        hasSetDir = true;
      }
      hitBox.setRotation(0);
      hitBox.setAngularVelocity(0);

      jumps = 2;

      //if car rightside up
      if (abs(degrees(hitBox.getRotation())%360) > 330 || abs(degrees(hitBox.getRotation())%360) < 60)
      {
        hitBox.addForce(0, 30000);
      }
    } else hasSetDir = false;

    //boost ======================================================================
    for (int i = 0; i < myBoost.size(); i++)
    {
      myBoost.get(i).show();
      myBoost.get(i).act();
      if (myBoost.get(i).boostTimer > 50)
      {
        myBoost.remove(i);
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

  void reset()
  {
    hitBox.setRotation(0);
    hitBox.setPosition(startX, startY);
    hitBox.setVelocity(0, 0);
    if (startX < ball.getX()) xDir = 1;
    else xDir = -1;
  }
}
