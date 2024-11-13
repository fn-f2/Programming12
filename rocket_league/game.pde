void game()
{
  background(#AED3E0);

  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw

  pushMatrix();
  translate(ball.getX(), ball.getY());
  rotate(ball.getRotation());
  for (int i = 0; i < 360; i+= 120)
  {
    pushMatrix();
    rotate(radians(i));
    fill(#505050);
    triangle(-10, -10, -50, 0, -10, 10);
    popMatrix();
  }
  fill(#303030);
  circle(0, 0, 40);
  if (ball.getX() < width/2) fill(blue);
  else if (ball.getX() > width/2) fill(orange);
  else fill(#ffffff);
  circle(0, 0, 20);
  popMatrix();

  drawCars();

  fill(blue, 150);
  rect(-60, height/2-15, 200, 250);

  fill(orange, 150);
  rect(width+60, height/2-15, 200, 250);


  //detect goals
  if (ball.getX() > width+40)
  {
    ball.setVelocity(0, 0);
    ball.setAngularVelocity(0);
    ball.setPosition(width/2, height*0.9);
    score1++;
    for (int i = 0; i < myCars.size(); i++) myCars.get(i).reset();
  }

  if (ball.getX() < -40)
  {
    ball.setVelocity(0, 0);
    ball.setAngularVelocity(0);
    ball.setPosition(width/2, height*0.9);
    score2++;
    for (int i = 0; i < myCars.size(); i++) myCars.get(i).reset();
  }

  //scoreboard
  fill(0, 180);
  rect(width/2, 30, 200, 60);
  fill(#ffffff);
  textSize(50);
  text(timer, width/2, 30);

  fill(blue);
  rect(width/2-120, 30, 60, 60);
  fill(#ffffff);
  textSize(50);
  text(score1, width/2-120, 30);

  fill(orange);
  rect(width/2+120, 30, 60, 60);
  fill(#ffffff);
  textSize(50);
  text(score2, width/2+120, 30);
}

void gameClick()
{
}