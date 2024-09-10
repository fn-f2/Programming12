//carter kwong Computer Programming 1-4

void setup()
{
  size(600, 600);
}

void draw()
{
  rectMode(CENTER);
  noStroke();
  //background(#f5f5f5);
  background(#f2a604);
  
  //ground
  fill(#383737);
  rect(width/2, 524, width, 180);
  
  car(0, 0);
}

void car(float x, float y)
{
  pushMatrix();
  translate(x, y);
  shadow();
  body();
  windows();
  mirror();
  wheel();
  popMatrix();
}

void shadow()
{
  fill(#000000, 169);
  ellipse(531, 483, 880, 20);
}

void body()
{
  //panels
  fill(#000000);
  quad(134, 310, 116, 301, 117, 386, 136, 378);
  
  fill(#b6aa79);
  ellipse(125, 344, 11, 39); //headlights
  
  fill(#535252);
  quad(600, 306, 132, 318, 140, 435, 600, 436);
  fill(#c9c9c9);
  quad(600, 266, 122, 306, 134, 321, 600, 307);
  fill(#535252);
  quad(398, 266, 116, 300, 123, 307, 435, 280);
  fill(#c9c9c9);
  quad(600, 144, 580, 148, 433, 280, 600, 267);
  
  fill(#151515);
  rect(153, 393, 117, 36);
  fill(#000000);
  rect(407, 380, 397, 9);
  fill(#593111);
  rect(171, 393, 47, 9);
  
  //side skirts
  fill(#525252);
  rect(178, 423, 117, 24);
  fill(#121212);
  quad(600, 435, 121, 435, 115, 460, 600, 460);
  
  //wheel area thingy
  fill(#bababa);
  ellipse(294, 392, 166, 148); 
  fill(#000000);
  ellipse(294, 401, 166, 142);
  quad(372, 379, 209, 404, 206, 446, 388, 440);
  
  //panel gaps
  strokeWeight(2);
  stroke(#000000);
  line(435, 312, 444, 439);
  line(451, 279, 435, 312);
  line(443, 428, 600, 428);
  noStroke();
}

void windows()
{
  fill(#0d191b);
  quad(600, 155, 584, 158, 450, 280, 600, 278);
  quad(580, 148, 558, 159, 396, 267, 433, 280);
}

void mirror()
{
  fill(#414141);
  triangle(500, 235, 451, 279, 502, 279);
  fill(#414141);
  quad(511, 238, 483, 250, 489, 278, 514, 269);
  fill(#2f2f2f);
  quad(502, 248, 483, 250, 489, 278, 506, 266);
}

void wheel()
{
  fill(#181818);
  ellipse(295, 415, 153, 153);
  fill(#a6a6a6);
  ellipse(295, 415, 117, 117);
  fill(#000000);
  ellipse(295, 415, 93, 93);
  spokes();
}

void spokes()
{
  fill(#a6a6a6);
  pushMatrix();
  translate(295, 415);
  fill(#a6a6a6);
  
  //spokes
  for (int i = 0; i < 360; i+=72)
  {
    pushMatrix();
    rotate(radians(i));
    quad(6, -50, -6, -50, -12, 0, 12, 0);
    popMatrix();
  }
  
  circle(0, 0, 40);
  fill(#828282);
  circle(0, 0, 37);
  
  //wheel hardware
  for (int i = 45; i < 405; i+=90)
  {
    pushMatrix();
    rotate(radians(i));
    fill(#000000);
    circle(0, 15, 8);
    popMatrix();
  }
  
  fill(#000000);
  circle(0, 0, 15);
  popMatrix();

}
