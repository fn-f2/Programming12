void lvlselect()
{
  click();
  background(#ffffff);

  fill(#ffe88a);
  textSize(40);
  text("L E V E L   S E L E C T", width/2, 50);

  level1.show();
  if (level1.clicked)
  {
    level = 1;
    loadWorld("map.png");
    loadPlayer();
    mode = GAME;
  }
  level2.show();
  if (level2.clicked)
  {
    level = 2;
    loadWorld("testmap.png");
    loadPlayer();
    mode = GAME;
  }
  level3.show();
  if (level3.clicked)
  {
    level = 3;
    loadWorld("map.png");
    loadPlayer();
    mode = GAME;
  }
  back.show();
  if (back.clicked)
  {
    mode = INTRO;
  }
}

void lvlselectClick()
{
}
