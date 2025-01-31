class FGameObject extends FBox
{
  int L = -1;
  int R = 1;
  
  FGameObject()
  {
    super(gridSize, gridSize);
    setGrabbable(false);
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

  void reset()
  {
  }
}
