//carter kwong Computer Programming 1-4


void setup()
{
  size(600, 600);
}

void draw()
{

  rectMode(CENTER);
  background(#ffffff);
  
  //walls
  fill(#bf7c4a);
  stroke(#000000);
  strokeWeight(7);
  rect(width/2, 416, 250, 220);
  noStroke();
  fill(#f49a5f);
  rect(width/2, 416, 220, 190);
  
  //chimney
  fill(#bf7c4a);
  stroke(#000000);
  strokeWeight(7);
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
  
  fill(#000000);
  noStroke();
  circle(286, 436, 7); //handle
  
  //steps
  fill(#8d3434);
  stroke(#000000);
  rect(300, 510, 106, 33);
  line(247, 510, 351, 510);
  
  //windows
  noStroke();
  fill(#bf7c4a);
  rect(373, 405, 57, 50);
  fill(#87b2ec);
  stroke(#000000);
  rect(373, 393, 50, 50);
  line(350, 386, 395, 386);
  line(373, 417, 373, 386);
  
  noStroke();
  fill(#bf7c4a);
  rect(229, 405, 57, 50);
  fill(#87b2ec);
  stroke(#000000);
  rect(228, 393, 50, 50);
  line(203, 386, 250, 386);
  line(229, 417, 229, 386);
}
