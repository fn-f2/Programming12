void mouseReleased()
{
  switch (mode)
  {
  case INTRO:
    introClick();
    break;
  case GAME:
    gameClick();
    break;
  case PAUSE:
    pauseClick();
    break;
  case GAMEOVER:
    gameoverClick();
    break;
  }
}
