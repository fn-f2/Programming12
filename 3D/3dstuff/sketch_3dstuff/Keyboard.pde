void keyPressed()
{
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == 'q' || key == 'Q') qkey = true;
  if (key == 'e' || key == 'E') ekey = true;
  if (key == 'c' || key == 'C') ckey = true;
  if (keyCode == SHIFT) shiftkey = true;
  if (keyCode == 32) spacekey = true;
}

void keyReleased()
{
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == 'q' || key == 'Q') qkey = false;
  if (key == 'e' || key == 'E') ekey = false;
  if (keyCode == SHIFT) shiftkey = false;
  if (keyCode == 32) spacekey = false;
}
