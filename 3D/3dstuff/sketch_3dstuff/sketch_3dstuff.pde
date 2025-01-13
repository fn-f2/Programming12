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
  rectMode(CENTER);
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
  if (shiftkey)
  {
    sprint = true;
    if (!ckey)speed = 40;
  } else
  {
    sprint = false;
    if (!ckey) speed = 20;
  }

  if (wkey)
  {
    eyeX += speed*cos(LRHeadAngle);
    eyeZ += speed*sin(LRHeadAngle);
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
  background(#ffffff);
  pushMatrix();
  if (ckey)
  {
    if (sprint) speed = 80;
    else speed = 40;
    if (eyeY < height/2+100)
    {
      eyeY += 15;
    }
  } else if (eyeY > height/2) eyeY -= 15;

  println(speed);

  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  drawFloor(1000, 50);
  drawFocalPoint();
  controlCamera();
  popMatrix();

  if (focused) rbt.warpPointer(width/2, height/2);

  fill(0);
  rect(width/2, height/2, 2, 20);
  rect(width/2, height/2, 20, 2);
}

void drawFloor(int d, int s)
{
  for (int x = floor(eyeX/s)-floor(d/s/2); x < floor(eyeX/s)+floor(d/s/2); x++)
  {
    for (int z = floor(eyeZ/s)-floor(d/s/2); z < floor(eyeZ/s)+floor(d/s/2); z++)
    {
      stroke(0);
      //line(x*s, height, eyeZ-d/2, x*s, height, eyeZ+d/2);
      //line(eyeX-d/2, height, z*s, eyeX+d/2, height, z*s);
      if (dist(x*s, z*s, eyeX, eyeZ) < d/2)
      {
        fill(#262626);
        beginShape(QUADS);
        fill(#262626);
        vertex(x*s-s/2, height, z*s-s/2);
        vertex(x*s+s/2, height, z*s-s/2);
        vertex(x*s+s/2, height, z*s+s/2);
        vertex(x*s-s/2, height, z*s+s/2);
        endShape();
      }
    }
  }
}

void drawFocalPoint()
{
  pushMatrix();
  translate(focusX, focusY, focusZ);
  stroke(#ffffff);
  //sphere(5);
  popMatrix();
}
