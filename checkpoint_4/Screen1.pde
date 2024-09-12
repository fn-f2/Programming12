void screen1()
{
  background(#000000);
  stroke(#ffffff);
  strokeWeight(2);
  int x = 50;
  int y = 50;
  int type = 1;
  while(y <= height)
  {
    unit(x, y, type);
    x+=100;
    type *= -1;
    if (x >= width)
    {
      x = 50;
      y+= 100;
      type *= -1;
    }
  }
}

void screen1Click()
{
  mode++;
}

void unit(int x_, int y_, int type_)
{
  pushMatrix();
  translate(x_, y_);
  if (type_ == 1) rotate(radians(90));
  else rotate(radians(0));
  int y1 = -50;
  int y2 = -50;
  int i = 0;
  while(i < 21)
  {
    line(-50, y1, 50, y2);
    if (i < 10) y1 += 10;
    else y2 += 10;
    i++;
  }
  popMatrix();
}
