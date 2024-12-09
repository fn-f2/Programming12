class FGameObject extends FBox
{
  FGameObject()
  {
    super(gridSize, gridSize);
  }

  void act()
  {
    
  }

  void isTouching(String n)
  {
    ArrayList<FContact> contactList = getContacts();
    for (int i = 0; i < contactList.size(); i++)
    {
      FContact myContact = contactList.get(i);
      if (myContact.contains(n)) setPosition(0, 0);
    }
  }
}
