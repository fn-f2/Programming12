class FGameObject extends FBox
{
  FGameObject()
  {
    super(gridSize, gridSize);
  }

  void act()
  {
    //int a = 20;
    //for (int i = 30; i < 150; i+=5)
    //{
    //  noStroke();
    //  fill(255, a);
    //  circle(getX()*zoom, getY()*zoom, i);
    //  a--;
    //}
  }

  boolean isTouching(String n)
  {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++)
    {
      FContact fc = contacts.get(i);
      if (fc.contains(n)) return true;
    }
    return false;
  }
}
