//carter kwong Computer Programming 1-4

void setup()
{
  size(600, 600);
}

void draw()
{
  rectMode(CENTER);
  noStroke();
  background(#f5f5f5);
  //background(#000000);
  
  //ground
  fill(#838383);
  rect(width/2, 524, width, 180);
  
  car();
}

void car()
{
  body();
  windows();
  mirror();
  wheel();
}

void body()
{
  //panels
  fill(#000000);
  quad(134, 310, 116, 301, 117, 386, 136, 378);
  
  fill(#303030);
  ellipse(125, 344, 11, 39); //headlights
  
  fill(#535252);
  quad(600, 306, 132, 318, 140, 435, 600, 436);
  fill(#c9c9c9);
  quad(600, 266, 122, 306, 134, 321, 600, 307);
  fill(#535252);
  quad(398, 266, 116, 300, 123, 307, 435, 280);
  fill(#c9c9c9);
  quad(600, 144, 580, 148, 433, 280, 600, 267);
  
  fill(#000000);
  rect(153, 393, 117, 36);
  fill(#000000);
  rect(407, 380, 397, 9);
  fill(#593111);
  rect(171, 393, 47, 9);
  
  //side skirts
  fill(#525252);
  rect(178, 423, 117, 24);
  fill(#000000);
  quad(600, 435, 121, 435, 115, 460, 600, 460);
  
  //wheel area thingy
  fill(#bababa);
  ellipse(294, 392, 166, 148); 
  fill(#000000);
  ellipse(294, 401, 166, 142);
  quad(352, 379, 209, 404, 206, 446, 366, 440);
}

void windows()
{

}

void mirror()
{

}

void wheel()
{
  fill(#181818);
  ellipse(295, 415, 153, 153);
}
