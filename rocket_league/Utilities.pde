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

void fullReset()
{
  score1 = 0;
  score2 = 0;
  endtimer = 0;
  gameover = false;
  for (int i = 0; i < myCars.size(); i++)
  {
    myCars.get(i).reset();
  }
  ball.setPosition(width/2, height*0.87);
}
