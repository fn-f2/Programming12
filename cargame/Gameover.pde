void gameover()
{
}

void gameoverClick()
{
  for (int i = 0; i < myCars.size(); i++)
  {
    myCars.get(i).resetC();
  }
  for (int i = 0; i < myObstacles.size(); i++)
  {
    myObstacles.remove(i);
  }
  mode = GAME;
}
