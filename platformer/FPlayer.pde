class FPlayer extends FBox
{
  FPlayer()
  {
    super(gridSize, gridSize);
    setPosition(300, 200);
    setFillColor(#ff0000);
    setNoStroke();
    setRestitution(0);
  }

  void act()
  {
    float vy = getVelocityY();
    if (akey) setVelocity(-100, vy);
    if (dkey) setVelocity(100, vy);
    if (getVelocityX() > 180) setVelocity(150, vy);
    if (getVelocityX() < -180) setVelocity(-150, vy);

    float vx = getVelocityX();
    if (wkey && hitGround()) setVelocity(vx, -400);

    setAngularVelocity(0);
    setRotation(maprotation);
  }

  boolean hitGround()
  {
    ArrayList<FContact> contactList = getContacts();
    for (int i = 0; i < contactList.size(); i++)
    {
      FContact myContact = contactList.get(i);
      if (myContact.contains("ice")) return true;
      if (myContact.contains("ground")) return true;
      if (myContact.contains("trampoline")) return true;
    }
    return false;
  }
}
