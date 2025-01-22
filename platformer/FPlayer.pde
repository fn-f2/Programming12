class FPlayer extends FGameObject
{
  int jumpPower, runV;
  int frame = 0;
  int direction;
  final int L = -1;
  final int R = 1;

  FPlayer(float x, float y)
  {
    super();
    setPosition(x, y);
    setFillColor(#ffe88a);
    setRotatable(false);
    setNoStroke();
    setRestitution(0);
    setName("player");
    jumpPower = 350;
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
      fill(#ffe88a, a);
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
    if (onTopOf("spike") || isTouching("bullet") || (isTouching("lock") && !unlocked))
    {
      if (level == 1)
      {
        loadWorld("map.png");
        loadPlayer(100, 520);
      } else if (level == 2)
      {
        loadWorld("map2.png");
        loadPlayer(500, 520);
      }
      mapangle = 0;
      mrotation = 1;
      setVelocity(0, 0);
    }

    if (isTouching("finish"))
    {
      loadWorld("map2.png");
      if (level == 1) loadPlayer(100, 520);
      else if (level == 2) loadPlayer(500, 520);
      mapangle = 0;
      mrotation = 1;
      setVelocity(0, 0);
      if (level < 3) level++;
      else mode = GAMEOVER;
    }
  }

  void jump(float vx, float vy)
  {

    if (onTopOf("stone") || onTopOf ("bridge") || onTopOf("movingplat"))
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
      }
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
