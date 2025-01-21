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
}

void gameClick()
{
}
