/* carter kwong prog 12
 2025/01/08 */

//import java.awt.Robot;
import com.jogamp.newt.opengl.GLWindow;

GLWindow rbt;
//Robot rbt;

boolean skipFrame;

boolean sprint, crouch;
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

  rbt = (GLWindow)surface.getNative();
  rbt.confinePointer(true);

  eyeX = width/2;
  eyeY = height/2;
  eyeZ = 0;
  focusX = width/2;
  focusY = width/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;
  noCursor();

  sprint = false;
  speed = 10;
}

void controlCamera()
{
  if (shiftkey) sprint = true;
  else sprint = false;

  if (wkey)
  {
    eyeX += speed*cos(LRHeadAngle);
    eyeZ += speed*sin(LRHeadAngle);
  }
  if (skey)
  {
    eyeX -= speed*cos(LRHeadAngle);
    eyeZ -= speed*sin(LRHeadAngle);
  }
  if (akey)
  {
    eyeX -= speed*cos(LRHeadAngle + PI/2);
    eyeZ -= speed*sin(LRHeadAngle + PI/2);
  }
  if (dkey)
  {
    eyeX -= speed*cos(LRHeadAngle - PI/2);
    eyeZ -= speed*sin(LRHeadAngle - PI/2);
  }

  if (skipFrame == false) {
    LRHeadAngle += 0.01*(mouseX - width/2);
    UDHeadAngle +=  0.01*(mouseY - height/2);
  }
  if (UDHeadAngle > PI/2.5) UDHeadAngle = PI/2.5;
  if (UDHeadAngle < -PI/2.5) UDHeadAngle = -PI/2.5;

  focusX = eyeX + 300*cos(LRHeadAngle);
  focusZ = eyeZ + 300*sin(LRHeadAngle);
  focusY = eyeY + 300*tan(UDHeadAngle);
}

void draw()
{
  background(0);
  pushMatrix();
  if (ckey)
  {
    speed = 20;
    if (eyeY < height/2+100)
    {
      eyeY += 15;
    }
  } else if (eyeY > height/2) eyeY -= 15;

  println(eyeY);

  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  drawFloor();
  drawFocalPoint();
  controlCamera();
  popMatrix();

  if (focused) rbt.warpPointer(width/2, height/2);
}

void drawFloor()
{
  stroke(255);
  //for (int x = -2000; x <= 2000; x += 100)
  //{
  //  stroke(#ffffff);
  //  line(x, height, -2000, x, height, 2000);
  //  line(-2000, height, x, 2000, height, x);
  //}

  for (float x = -2000; x <= 2000; x += 100)
  {
    stroke(#FF0000);
    line(x, height, -2000, x, height, 2000);
  }
}

void drawFocalPoint()
{
  pushMatrix();
  translate(focusX, focusY, focusZ);
  stroke(#ffffff);
  sphere(5);
  popMatrix();
}
