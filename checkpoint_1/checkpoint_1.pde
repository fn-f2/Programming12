//carter kwong Computer Programming 1-4

color bg;
color sunmooncolor;
float r = 0;
float a = 0; //night sky opacity
float a2 = 0; //darkness opacity
int day = 1;

void setup()
{
  size(600, 600);
  strokeWeight(7);
}

void draw()
{
  rectMode(CENTER);
  bg = color(#b4d7ff);
  background(bg);
  noStroke();
  if (day == 1 && r < -20 && a >= 0) a-=4;
  else if (day == -1 && r < -20 && a <= 255) a+=4;
  fill(#221f5a, a);
  square(width/2, height/2, 600);
  
  //sky
  stroke(#000000);
  fill(#7ba13e);
  rect(width/2, height*0.9, width+10, 130);
  
    //walls
  fill(#bf7c4a);
  stroke(#000000);
  rect(width/2, 416, 250, 220);
  noStroke();
  fill(#f49a5f);
  rect(width/2, 416, 220, 190);
  
  //chimney
  fill(#bf7c4a);
  stroke(#000000);
  rect(393, 231, 33, 83);
  noStroke();
  fill(#f68c52);
  rect(393, 231, 26, 55);
  fill(#8d3434);
  stroke(#000000);
  rect(393, 177, 59, 25);
  
  //roof
  fill(#8d3434);
  stroke(#000000);
  triangle(485, 307, width/2, 150, 115, 307);
  noStroke();
  fill(#f68c52);
  triangle(446, 293, width/2, 170, 155, 293);
  
  //door
  fill(#8d3434);
  stroke(#000000);
  rect(300, 436, 56, 135);
   //handle
  fill(#000000);
  noStroke();
  circle(286, 436, 7);
  
  //steps
  fill(#8d3434);
  stroke(#000000);
  rect(300, 510, 106, 33);
  line(247, 510, 351, 510);
  
  //window shadows
  noStroke();
  fill(#bf7c4a);
  rect(373.5, 405, 57, 50);
  
  noStroke();
  fill(#bf7c4a);
  rect(228.5, 405, 57, 50);
  
  //sky darkness
  noStroke();
  if (day == 1 && r < -20 && a2 >= 0) a2-=2;
  else if (day == -1 && r < -20) a2+=2;
  fill(#000000, a2);
  square(width/2, height/2, 600);
  
  //windows
  fill(#87b2ec);
  stroke(#000000);
  rect(373, 393, 50, 50);
  line(350, 386, 395, 386);
  line(373, 417, 373, 386);
  
  fill(#87b2ec);
  stroke(#000000);
  rect(228, 393, 50, 50);
  line(203, 386, 250, 386);
  line(229, 417, 229, 386);
  
  //sun/moon
  pushMatrix();
  translate(300, 600);
  rotate(radians(r));
  r+=0.5;
  if (r >= 55)
  {
    r = -55;
    day *= -1;
  }
  if (day==1) sunmooncolor = color(#ffe401);
  else sunmooncolor = color(#ffffff);
  fill(sunmooncolor);
  stroke(#000000);
  circle(0, -550, 80);
  popMatrix();
}
