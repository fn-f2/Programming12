class FPlayer extends FGameObject
{
  int jumpPower;

  FPlayer()
  {
    super();
    setPosition(300, 200);
    setFillColor(#ff0000);
    setNoStroke();
    setRestitution(0);
    setName("player");
    jumpPower = 20;
  }

  void act()
  {
    handleInput();
    setAngularVelocity(0);
    setRotation(0);
  }

  void handleInput()
  {
    float vy = getVelocityY();
    if (akey) left(vy);
    if (dkey) right(vy);

    if (wkey) jump();
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
    if (maprotation==1) setVelocity(-150, vy);
    else if (maprotation==2) setVelocity(jumpPower, 0);
    else if (maprotation==3) setVelocity(0, jumpPower);
    else if (maprotation==4) setVelocity(-jumpPower, 0);
  }

  void right(float vy)
  {
    if (maprotation==1) setVelocity(150, vy);
    else if (maprotation==2) setVelocity(jumpPower, 0);
    else if (maprotation==3) setVelocity(0, jumpPower);
    else if (maprotation==4) setVelocity(-jumpPower, 0);
  }
}
