void hover(float x, float y, float w, float h, color c, color cc)
{
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) fill(c);
  else if (cc==none) noFill();
  else fill(cc);
}

void tintHover(float x, float y, float w, float h, color c, color cc)
{
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) tint(c, 255);
  else tint(cc, 255);
}

void strokeHover(float x, float y, float w, float h, color c, color cc)
{
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) stroke(c);
  else stroke(cc);
}

int coinFlip() //return 1 or 0
{
  int rand = int(random(0, 2));
  return rand;
}

void reset()
{
}

void button(float x, float y, float w, float h, color c, color cc)
{
  //hover(x, y, w, h, c, cc);
}
