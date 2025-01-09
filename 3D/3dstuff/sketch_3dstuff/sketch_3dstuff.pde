/* carter kwong prog 12
 2025/01/08 */

import java.awt.Robot;
import com.jogamp.newt.opengl.GLWindow;

GLWindow r;
Robot rbt;

boolean skipFrame;

boolean sprint;
int speed;

//keyboard
boolean wkey, akey, skey, dkey, qkey, ekey, ckey, shiftkey, spacekey;
boolean qReleased, eReleased, qWasPressed, eWasPressed;

float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float LRHeadAngle, UDHeadAngle;

void setup()
{
  //fullScreen(P3D);
  size(600, 600, P3D);
  textureMode(NORMAL);
  perspective();

  r = (GLWindow)surface.getNative();
  r.confinePointer(true);
  r.setPointerVisible(false);

  eyeX = width/2;
  eyeY = height/2;
  eyeZ = 0;
  focusX = width/2;
  focusY = width/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;
  //LRHeadAngle = radians(270);
  //noCursor();
  try
  {
    rbt = new Robot();
  }
  catch(Exception e)
  {
    e.printStackTrace();
  }
  skipFrame = false;

  sprint = false;
  speed = 10;
}

void controlCamera()
{
  if (shiftkey) sprint = true;
  else sprint = false;

  if (sprint) speed = 15;
  else speed = 10;

  if (wkey)
  {
    eyeX += 10*cos(LRHeadAngle);
    eyeZ += 10*sin(LRHeadAngle);
  }
  if (skey)
  {
    eyeX -= 10*cos(LRHeadAngle);
    eyeZ -= 10*sin(LRHeadAngle);
  }
  if (akey)
  {
    eyeX -= 10*cos(LRHeadAngle + PI/2);
    eyeZ -= 10*sin(LRHeadAngle + PI/2);
  }
  if (dkey)
  {
    eyeX -= 10*cos(LRHeadAngle - PI/2);
    eyeZ -= 10*sin(LRHeadAngle - PI/2);
  }
  
  ////mouse screen wrap
  //if (skipFrame == false) {
  //  LRHeadAngle += 0.01*(mouseX - pmouseX);
  //  UDHeadAngle +=  0.01*(mouseY - pmouseY);
  //}
  //if (UDHeadAngle > PI/2.5) UDHeadAngle = PI/2.5;
  //if (UDHeadAngle < -PI/2.5) UDHeadAngle = -PI/2.5;

  focusX = eyeX + 300*cos(LRHeadAngle);
  focusZ = eyeZ + 300*sin(LRHeadAngle);
  focusY = eyeY + 300*tan(UDHeadAngle);

  if (mouseX > width-2)
  {
    rbt.mouseMove(2, mouseY);
    skipFrame = true;
  } else if (mouseX < 2)
  {
    skipFrame = true;
    rbt.mouseMove(width-2, mouseY);
  } else skipFrame = false;
}

void draw()
{
  background(0);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  drawFloor();
  drawFocalPoint();
  controlCamera();
  
  r.warpPointer(width/2, height/2);
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
