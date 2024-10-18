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
void wkeyCheck()
{
  wkeyReleased = false;
  if (wkey)
    wkeyWasPressed = true;
  if (wkeyWasPressed && !wkey)
  {
    wkeyReleased =  true;
    wkeyWasPressed = false;
  }
}
