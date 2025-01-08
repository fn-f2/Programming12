/* carter kwong prog 12
2025/01/08 */

boolean sprint;
int speed;

//keyboard
boolean wkey, akey, skey, dkey, qkey, ekey, ckey, shiftkey, spacekey;
boolean qReleased, eReleased, qWasPressed, eWasPressed;

float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;

void setup()
{
  size(600, 600, P3D);
  //textureMode(NORMAL);
  perspective();
  
  eyeX = width/2;
  eyeY = height/2;
  eyeZ = 0;
  focusX = width/2;
  focusY = width/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;
  
  sprint = false;
  speed = 10;
}

void controlCamera()
{ 
  if (shiftkey) sprint = true;
  else sprint = false;
  
  if (sprint) speed = 15;
  else speed = 10;
  
  if (wkey) eyeZ -= 10;
  if (skey) eyeZ += 10;
  if (akey) eyeX -= 10;
  if (dkey) eyeX += 10;
  
  
  
  focusX = eyeX;
  focusY = eyeY;
  focusZ = eyeZ - 300;
}

void draw()
{
  background(0);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  drawFloor();
  drawFocalPoint();
  controlCamera();
}

void drawFloor()
{
  stroke(255);
  for (int x = -2000; x <= 2000; x += 100)
  {
    line(x, height, -2000, x, height, 2000);
    line(-2000, height, x, 2000, height, x);
  }
}

void drawFocalPoint()
{
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}
