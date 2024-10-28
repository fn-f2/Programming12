void keyPressed()
{
  if (key == 'w' || key == 'W' && car1.canJump) wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (keyCode == UP && car2.canJump) upkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == RIGHT) rightkey = true;
}

void keyReleased()
{
  if (key == 'w' || key == 'W')
  {
    wkey = false;
    car1.canJump = true;
  }
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;

  if (keyCode == UP)
  {
    upkey = false;
    car2.canJump = false;
  }
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == RIGHT) rightkey = false;
}
