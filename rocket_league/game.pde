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



  //detect goal right
  if (ball.getX() > width+40)
  {
    ball.setVelocity(0, 0);
    ball.setAngularVelocity(0);
    if (!gameover) score1++;

    //if win
    if (score1 >= 4)
    {
      gameover = true;
      endtimer++;
      if (endtimer > 50)
      {
        fill(0, 3*(endtimer-50));
        rect(width/2, height/2, width, height);
        fill(#ffffff, 5*(endtimer-50));
        text("P L A Y E R   1   W I N S", width/2, height/2);
      }
      
      if (endtimer > 100)
      {
        mode = GAMEOVER;
      }
    }
    if (!gameover) ball.setPosition(width/2, height*0.9);
    else ball.setPosition(width*2, height/2);
    if (!gameover) for (int i = 0; i < myCars.size(); i++) myCars.get(i).reset();
  }

  //detect goal left
  if (ball.getX() < -40)
  {
    ball.setVelocity(0, 0);
    ball.setAngularVelocity(0);
    if (!gameover) score2++;

    //if win
    if (score2 >= 4)
    {
      gameover = true;
      endtimer++;
      if (endtimer > 50)
      {
        fill(0, 3*(endtimer-50));
        rect(width/2, height/2, width, height);
        fill(#ffffff, 5*(endtimer-50));
        text("P L A Y E R   2   W I N S", width/2, height/2);
      }
      if (endtimer > 100)
      {
        mode = GAMEOVER;
      }
    }
    if (!gameover) ball.setPosition(width/2, height*0.9);
    else ball.setPosition(-width, height*2);
    if (!gameover) for (int i = 0; i < myCars.size(); i++) myCars.get(i).reset();
  }

  //scoreboard
  fill(0, 180);
  rect(width/2, 30, 200, 60);
  fill(#ffffff);
  textSize(20);
  text("F I R S T   T O   4", width/2, 30);

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
