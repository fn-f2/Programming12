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
    setPosition(300, 200);
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
    handleInput();
    collisions();
    animate();
  }

  void animate()
  {
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0)
    {
      if (direction == R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }

  void handleInput()
  {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (akey) left(vx, vy);
    if (dkey) right(vx, vy);

    if (wkey) jump(vx);

    if (abs(vy) > .1) action = jump;

    if (vy == 0 && vx == 0) action = idle;
  }

  void collisions()
  {
    if (isTouching("spike"))
    {
      setPosition(0, 0);
      setVelocity(0, 0);
    }
  }

  void jump(float vx)
  {
    
    if (isTouching("stone") || isTouching("treetop") || isTouching ("bridge"))
    {
      if (maprotation==1) setVelocity(vx, -jumpPower);
      else if (maprotation==2) setVelocity(jumpPower, vx);
      else if (maprotation==3) setVelocity(vx, jumpPower);
      else if (maprotation==4) setVelocity(-jumpPower, vx);
    }
  }

  void left(float vx, float vy)
  {
    direction = L;
    action = run;
    if (maprotation==1) setVelocity(-runV, vy);
    else if (maprotation==2) setVelocity(vx, -runV);
    else if (maprotation==3) setVelocity(runV, vy);
    else if (maprotation==4) setVelocity(vx, runV);
  }

  void right(float vx, float vy)
  {
    direction = R;
    action = run;
    if (maprotation==1) setVelocity(runV, vy);
    else if (maprotation==2) setVelocity(vx, runV);
    else if (maprotation==3) setVelocity(-runV, vy);
    else if (maprotation==4) setVelocity(vx, -runV);
  }
}
