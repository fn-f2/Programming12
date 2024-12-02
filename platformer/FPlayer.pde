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
    float vy = sqrt(sq(getVelocityY())+sq(getVelocityX()));
    if (akey) setVelocity(-150*cos(-maprotation), -150*sin(-maprotation));
    if (dkey) setVelocity(150*cos(-maprotation), 150*sin(-maprotation));

    if (wkey && hitGround()) setVelocity(vy*sin(maprotation), vy*cos(-maprotation));

    setAngularVelocity(0);
    setRotation(-maprotation);
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
}
