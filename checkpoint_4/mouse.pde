void mouseReleased()
{
  switch (mode)
  {
  case SCREEN1:
    screen1Click();
    break;
  case SCREEN2:
    screen2Click();
    break;
  case SCREEN3:
    screen3Click();
    break;
  case SCREEN4:
    screen4Click();
    break;
  }
}
