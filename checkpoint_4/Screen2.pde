float bLength = sqrt(sq(80)-sq(40));
float yIncr = sqrt(sq(240)-sq(bLength*3));

void screen2()
{
  background(#ffffff);
  float segmentX = bLength*2;
  float segmentY = -100;
  int xOffset = -1;
  while(segmentY < height+150)
  {
    if (segmentX > width+150)
    {
      if (xOffset==-1) segmentX = -bLength;
      else segmentX = bLength*2;
      segmentY += yIncr;
      xOffset *= -1;
    }
    bigSegment(segmentX, segmentY);
    segmentX+=bLength*6;
  }
  
  noStroke();
  fill(#000000);
  circle(b1X, b1Y, 70);
  fill(#ffffff);
  triangle(b1X+20, b1Y, b1X-20, b1Y-20, b1X-20, b1Y+20);
  
  fill(#000000);
  circle(b2X, b2Y, 70);
}

void bigSegment(float x, float y)
{
  pushMatrix();
  translate(x, y);
  rotate(radians(0));
  segment(x, y, color(#4db5f0));
  rotate(radians(120));
  segment(x, y, color(#ff7b05));
  rotate(radians(120));
  segment(x, y, color(#1b3e63));
  popMatrix();
}

void segment(float x, float y, color c)
{
  stroke(c);
  strokeWeight(1.5);
  fill(c);
  quad(0, -80, -bLength, -40, 0, 0, bLength, -40);
  pushMatrix();
  translate(-bLength, -40);
  quad(0, -80, -bLength, -40, 0, 0, bLength, -40);
  popMatrix();
  pushMatrix();
  translate(bLength, -40);
  quad(0, -80, -bLength, -40, 0, 0, bLength, -40);
  popMatrix();
}

void screen2Click()
{
  if (dist(mouseX, mouseY, b1X, b1Y) <= 70)
  {
    mode--;
  }
  else if (dist(mouseX, mouseY, b2X, b2Y) <= 70)
  {
    mode+=2;
  }
}
