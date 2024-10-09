int coinFlip() //return 1 or 0
{
  int rand = int(random(0, 2));
  return rand;
}

void click()
{
  mouseReleased = false;
  if (mousePressed)
    wasPressed = true;
  if (wasPressed && !mousePressed)
  {
    mouseReleased =  true;
    wasPressed = false;
  }
}
