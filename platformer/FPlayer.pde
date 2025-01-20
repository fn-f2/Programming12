class FPlayer extends FGameObject
{
  int jumpPower, runV;
  int frame = 0;
  int direction;
  final int L = -1;
  final int R = 1;

  FPlayer()
  {
    super();
    setPosition(100, 520);
    setFillColor(#ff0000);
    setRotatable(false);
    setNoStroke();
    setRestitution(0);
    setName("player");
    jumpPower = 400;
    runV = 150;
  }

  void act()
  {
    pushMatrix();
    handleInput();
    collisions();
    animate();
    popMatrix();
  }

  void animate()
  {
    setRotation(-mapangle);
    //if (frame >= action.length) frame = 0;
    //if (frameCount % 10 == 0)
    //{
    //  if (direction == R) attachImage(action[frame]);
    //  if (direction == L) attachImage(reverseImage(action[frame]));
    //  frame++;
    //}
    int a = 20;
    for (int i = 30; i < 150; i+=5)
    {
      noStroke();
      fill(#ff0000, a);
      println(getX(), getY());
      circle(height/2, width/2, i);
      a--;
    }
  }

  void handleInput()
  {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (akey) left(vx, vy);
    else if (!dkey)
    {
      if (mrotation == 1 || mrotation == 3) setVelocity(0, vy);
      else if (mrotation == 2 || mrotation == 4) setVelocity(vx, 0);
    }

    if (dkey) right(vx, vy);
    else if (!akey)
    {
      if (mrotation == 1 || mrotation == 3) setVelocity(0, vy);
      else if (mrotation == 2 || mrotation == 4) setVelocity(vx, 0);
    }

    if (wkey) jump(vx, vy);

    if ((mrotation == 1 || mrotation == 3) && abs(vy) > .1) action = jump;
    else if ((mrotation == 2 || mrotation == 4) && abs(vx) > .1) action = jump;

    if (vy == 0 && vx == 0) action = idle;
  }

  void collisions()
  {
    if (onTopOf("spike"))
    {
      setPosition(100, 520);
      mapangle = 0;
      mrotation = 1;
      setVelocity(0, 0);
    }
  }

  void jump(float vx, float vy)
  {

    if (onTopOf("stone") || onTopOf("treetop") || onTopOf ("bridge"))
    {
      if (mrotation==1) setVelocity(vx, -jumpPower);
      else if (mrotation==2) setVelocity(-jumpPower, vy);
      else if (mrotation==3) setVelocity(vx, jumpPower);
      else if (mrotation==4) setVelocity(jumpPower, vy);
    }
  }

  void left(float vx, float vy)
  {
    direction = L;
    action = run;
    if (mrotation==1) setVelocity(-runV, vy);
    else if (mrotation==2) setVelocity(vx, runV);
    else if (mrotation==3) setVelocity(runV, vy);
    else if (mrotation==4) setVelocity(vx, -runV);
  }

  void right(float vx, float vy)
  {
    direction = R;
    action = run;
    if (mrotation==1) setVelocity(runV, vy);
    else if (mrotation==2) setVelocity(vx, -runV);
    else if (mrotation==3) setVelocity(-runV, vy);
    else if (mrotation==4) setVelocity(vx, runV);
  }

  boolean onTopOf(String n)
  {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++)
    {
      FContact fc = contacts.get(i);
      if (fc.contains(n))
      {
        return true;
        //  if ((mrotation == 1 || mrotation == 3) && getY() > fc.getY()) return true;
        //  else if ((mrotation == 2 || mrotation == 4) && getX() < fc.getX()) return true;
      }
      /*&& getX()+gridSize/2 > fc.getX()-gridSize/2+8*/
      /*&& getX()+gridSize/2 < fc.getX()+gridSize*1.5-8*/
    }
    return false;
  }

  boolean isGrounded()
  {
    ArrayList<FContact> contacts = getContacts();
    if (contacts.size() > 0) return true;
    return false;
  }
}
