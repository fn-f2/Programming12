class FPlayer extends FGameObject
{
  int jumpPower;
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
    jumpPower = 20;
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
    if (akey) left(vy);
    if (dkey) right(vy);

    if (wkey) jump();

    if (abs(vy) > .1) action = jump;
    if (vy == 0) action = idle;
  }

  void collisions()
  {
    if (isTouching("spike"))
    {
      setPosition(0, 0);
      setVelocity(0, 0);
    }
  }

  void jump()
  {
    if (maprotation==1) adjustVelocity(0, -jumpPower);
    else if (maprotation==2) adjustVelocity(jumpPower, 0);
    else if (maprotation==3) adjustVelocity(0, jumpPower);
    else if (maprotation==4) adjustVelocity(-jumpPower, 0);
  }

  void left(float vy)
  {
    direction = L;
    action = run;
    if (maprotation==1) setVelocity(-150, vy);
    else if (maprotation==2) setVelocity(jumpPower, 0);
    else if (maprotation==3) setVelocity(0, jumpPower);
    else if (maprotation==4) setVelocity(-jumpPower, 0);
  }

  void right(float vy)
  {
    direction = R;
    action = run;
    if (maprotation==1) setVelocity(150, vy);
    else if (maprotation==2) setVelocity(jumpPower, 0);
    else if (maprotation==3) setVelocity(0, jumpPower);
    else if (maprotation==4) setVelocity(-jumpPower, 0);
  }
}
