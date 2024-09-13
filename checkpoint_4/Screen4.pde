void screen4()
{
  pushMatrix();
  translate(width/2, height/2);
  background(#4d4d4d);
  fill(#3b3a3a);
  rect(0, 213, width, 175);//ground

  //shadow
  fill(#292929);
  
  int a = 255;
  for (int i = 200; i > 400; i+=6)
  {
    fill(#292929, a);
    ellipse(0, 226, i, i/1);
    a--;
  }

  //body panels (bottom to top)
  noStroke();
  fill(#000000);
  quad(-81, 200, -138, 200, -139, 216, -89, 216);
  fill(#c0c0c0);
  quad(-137, 200, -190, 200, -200, 225, -146, 225);
  fill(#b0afaf);
  quad(-134, 200, -138, 200, -147, 225, -135, 216);

  //exhaust pipe
  fill(#4d4343);
  circle(-110, 218, 30);
  quad(-121, 207, -136, 223, -116, 246, -95, 224);
  fill(#000000);
  circle(-123, 231, 30);

  fill(#c0c0c0);
  quad(190, 200, -95, 200, -97, 225, 200, 225);
  fill(#b2b1b1);
  quad(200, 180, -200, 180, -190, 200, 190, 200);
  fill(#c3c3c3);
  quad(207, 140, -207, 140, -200, 180, 200, 180);
  fill(#d2d0d0);
  stroke(#b4b3b3);
  strokeWeight(2);
  line(-203, 146, 203, 146);
  line(-199, 170, 199, 170);
  noStroke();
  quad(190, 115, -190, 115, -207, 140, 207, 140);
  fill(#c5c5c5);
  quad(195, 92, -195, 92, -193, 128, 193, 128);
  fill(#bebebe);
  quad(181, 17, -181, 17, -195, 92, 195, 92);
  fill(#c9c9c9);
  quad(102, -43, -102, -43, -150, 17, 150, 17);
  fill(#000000);
  quad(100, -40, -100, -40, -145, 17, 145, 17);

  //taillights
  fill(#440b00);
  quad(-86, 50, -188, 50, -196, 100, -86, 100);
  quad(188, 50, 86, 50, 86, 100, 196, 100);
  fill(#743603);
  quad(-167, 50, -188, 50, -196, 100, -173, 100);
  quad(188, 50, 167, 50, 173, 100, 196, 100);

  light(-114, 75);
  light(-150, 75);
  light(114, 75);
  light(149, 75);

  fill(#000000);
  quad(57, 69, -57, 69, -57, 122, 57, 122);
  quad(86, 69, -86, 69, -87, 100, 87, 100);
  fill(#dedcdc);
  quad(45, 76, -45, 76, -45, 116, 45, 116);
  popMatrix();
}

void light(float x, float y)
{
  pushMatrix();
  translate(x, y);

  float i = 30;
  float a = 100;
  while (i < 50)
  {
    fill(#c71300, a);
    circle(0, 0, i);
    i+=1;
    a-=5;
  }
  fill(#f82003);
  circle(0, 0, 30);
  popMatrix();


  //inner lights
  for (int i_ = 0; i_ < 360; i_+=60)
  {
    pushMatrix();
    translate(x, y);
    rotate(radians(i_));
    innerLight(0, 10);
    popMatrix();
  }

  for (int i_ = 0; i_ < 360; i_+=90)
  {
    pushMatrix();
    translate(x, y);
    rotate(radians(i_));
    innerLight(0, 4);
    popMatrix();
  }
}

void innerLight(float x, float y)
{
  fill(#ff602f);
  circle(x, y, 7);
  fill(#ffbca4);
  circle(x, y, 3);
}

void screen4Click()
{
  mode = SCREEN1;
}
