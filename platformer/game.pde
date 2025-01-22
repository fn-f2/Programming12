void game()
{
  background(#8ab7ff);
  fill(#82aef5);
  textSize(700);
  //if (level == 1) text("1", width/2, height/2);
  text(str(level), width/2, height/2);
  drawWorld();
  actWorld();
  qePress();
  
  fill(0);
  textSize(30);
  text("R E A C H   T H E   G R E E N", width/2, 30);
}

void gameClick()
{
  mode = PAUSE;
}
