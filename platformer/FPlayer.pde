class FPlayer extends FBox
{
  int jumpPower;

  FPlayer()
  {
    super(gridSize, gridSize);
    setPosition(300, 200);
    setFillColor(#ff0000);
    setNoStroke();
    setRestitution(0);

    jumpPower = 200;
  }

  void act()
  {
    float vy = getVelocityY();
    if (akey) left(vy);
    if (dkey) right(vy);

    if (wkey && hitGround()) jump();
    setAngularVelocity(0);
    setRotation(0);
  }

  boolean hitGround()
  {
    ArrayList<FContact> contactList = getContacts();
    for (int i = 0; i < contactList.size(); i++)
    {
      FContact myContact = contactList.get(i);
      if (myContact.contains("ground")) return true;
      if (myContact.contains("ice")) return true;
      if (myContact.contains("trampoline")) return true;
    }
    return false;
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
