void game()
{
  background(#f0a646);
  
  //road
  fill(#ca812c);
  noStroke();
  rect(width/2+74, height/2, 507, height+20); //road shadow
  strokeWeight(18);
  stroke(#000000);
  fill(#5f5f5f);
  rect(width/2, height/2, 507, height+20); //road outer
  noStroke();
  fill(#383838);
  rect(width/2, height/2, 433, height+20); //road inner
  
  //cars
  Car1.show();
  Car1.act(wkey, akey, skey, dkey);
  Car2.show();
  Car2.act(upkey, leftkey, downkey, rightkey);
}

void gameClick()
{
}
