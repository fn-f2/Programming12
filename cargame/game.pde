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

  //detect car off road
  for (int i = 0; i < myCars.size(); i++)
  {
    if (myCars.get(i).x < 200 || myCars.get(i).x > 800)
    {
      myCars.get(i).setLives(0);
      gameover = true;
    }
  }

  //collision
  updateCollision();

  //obstacles
  updateObstacles();
}

void gameClick()
{
  resetCars();
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

void updateObstacles()
{
  if (b) myObstacles.add(new Obstacle());
  xoff+=0.1;
  if (noise(xoff) > 0.6 && b)
  {
    b = false;
  }
  for (int i = 0; i < myObstacles.size(); i++)
  {
    myObstacles.get(i).show();
    myObstacles.get(i).act();
  }
}

void resetCars()
{
  for (int i = 0; i < myCars.size(); i++)
  {
    myCars.get(i).reset();
  }
}

void updateCollision()
{
  for (int i = 0; i < myCars.size(); i++)
  {
    for (int i2 = 0; i2 < myCars.size(); i2++)
    {
      if (dist(myCars.get(i).x, myCars.get(i).y, myCars.get(i2).x, myCars.get(i2).y) < 85
        && myCars.get(i).startX != myCars.get(i2).startX)
      {
        myCars.get(i).setCollide(true, myCars.get(i2));
      }
    }
  }
}
