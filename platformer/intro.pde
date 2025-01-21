void intro()
{
  click();
  background(#ffffff);
  play.show();
  if (play.clicked) mode = LVLSELECT;
  quit.show();
  if (quit.clicked) exit();
  
  fill(#ffe88a);
  textSize(70);
  text("P L A T F O R M E R", width/2, height/2-200);
}

void introClick()
{
}
