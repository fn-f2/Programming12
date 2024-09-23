void game()
{
  background(#f0a646);
  
  //road
  fill(#ca812c);
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
}

void gameClick()
{
}

void drawCars()
{
  Car1.show();
  Car1.act(wkey, akey, skey, dkey);
  Car2.show();
  Car2.act(upkey, leftkey, downkey, rightkey);
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
