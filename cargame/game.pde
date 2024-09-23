void game()
{
  background(bgcol);

  //road
  fill(#000000, 34);
  noStroke();
  rect(width/2+74, height/2, 484, height+20); //road shadow
  strokeWeight(18);
  stroke(#000000);
  fill(#595959);
  rect(width/2, height/2, 507, height+20); //road outer
  noStroke();
  fill(#323232);
  rect(width/2, height/2, 437, height+20); //road inner
  roadLines(); //lines

  //cars
  drawCars();
  
  for (int i = 0; i < myCars.size(); i++)
  {
    if (myCars.get(i).x < 200 || myCars.get(i).x > 800)
    {
      mode = GAMEOVER;
    }
  }
}

void gameClick()
{
}

void drawCars()
{
  for (int i = 0; i < myCars.size(); i++)
  {
    myCars.get(i).show();
    myCars.get(i).act();
  }
}

void roadLines()
{
  for (int i = 0; i < height*2; i+=160)
  {
    myRoadLines.add(new roadLine());

    roadLine line = myRoadLines.get(i/160);
    line.show(i-height);
    line.act();
  }
}
