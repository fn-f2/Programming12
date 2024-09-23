class roadLine
{
  float y;
  roadLine()
  {
    y = -1234;
  }

  void show(float yoffset)
  {
    noStroke();
    fill(#ffffff);
    if (y==-1234)
    {
      y = yoffset;
    }
    else rect(width/2, y, 27, 70);
  }

  void act()
  {
    y+=16;
    if (y>height+80)
    {
      y = -height+5;
    }
  }
}
