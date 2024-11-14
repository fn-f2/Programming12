void intro()
{
  click();
  textAlign(CENTER, CENTER);
  background(#AED3E0);
  fill(#ffffff);
  textSize(100);
  text("ROCKET LEAGUE", width/2, height/2);
  playBtn.show();
  if (playBtn.clicked) mode = GAME;
}

void introClick()
{
}
