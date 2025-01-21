class finishBlock extends FGameObject
{
  finishBlock(float x, float y)
  {
    super();
    setPosition(x, y);
    setStatic(true);
    setNoStroke();
    setFillColor(#5de368);
    setName("finish");
  }

  void act()
  {
  }
}
