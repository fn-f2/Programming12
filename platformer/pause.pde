void pause()
{
  click();
  background(#ffffff);
  fill(#ffe88a);
  textSize(40);
  text("P A U S E D", width/2, 50);
  resume.show();
  if (resume.clicked) mode = GAME;
  exit.show();
  if (exit.clicked) mode = INTRO;
}

void pauseClick()
{
}
