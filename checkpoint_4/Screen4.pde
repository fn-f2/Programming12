void screen4()
{
  pushMatrix();
  translate(width/2, height/2);
  background(#4d4d4d);
  fill(#3b3a3a);
  rect(0, 213, width, 175);//ground
  
  //body panels (bottom to top)
  noStroke();
  fill(#f1f1f1);
  quad(190, 200, -190, 200, -200, 225, 200, 225);
  fill(#e4e4e4);
  quad(200, 180, -200, 180, -190, 200, 190, 200);
  fill(#ebebeb);
  quad(207, 140, -207, 140, -200, 180, 200, 180);
  fill(#f1f1f1);
  stroke(#dedddd);
  strokeWeight(2);
  line(-203, 146, 203, 146);
  line(-199, 170, 199, 170);
  noStroke();
  quad(190, 115, -190, 115, -207, 140, 207, 140);
  fill(#ebebeb);
  quad(195, 92, -195, 92, -193, 128, 193, 128);
  fill(#ebebeb);
  quad(181, 17, -181, 17, -195, 92, 195, 92);
  fill(#f1f1f1);
  quad(102, -43, -102, -43, -150, 17, 150, 17);
  fill(#000000);
  quad(100, -40, -100, -40, -145, 17, 145, 17);
  popMatrix();
}

void screen4Click()
{
  mode = SCREEN1;
}
