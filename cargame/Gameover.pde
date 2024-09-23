void gameover()
{
}

void gameoverClick()
{
  for (int i = 0; i < myCars.size(); i++)
  {
    myCars.get(i).reset();
  }
  mode = GAME;
}
