/* carter kwong prog 12
 2025/01/08 */

//import java.awt.Robot;
import com.jogamp.newt.opengl.GLWindow;

GLWindow rbt;
//Robot rbt;

boolean skipFrame;

boolean sprint, crouch, jump;
float speed, jumpspeed, slidespeed;

//keyboard
boolean wkey, akey, skey, dkey, qkey, ekey, ckey, shiftkey, spacekey;
boolean qReleased, eReleased, qWasPressed, eWasPressed;

float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float LRHeadAngle, UDHeadAngle;

float chdist;

void setup()
{
  //fullScreen(P3D);
  size(600, 600, P3D);
  textureMode(NORMAL);
  rectMode(CENTER);
  perspective();
  noCursor();

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

  sprint = false;
  crouch = false;
  jump = false;
  speed = 10;
  jumpspeed = 50;
  slidespeed = 50;

  chdist = 8;
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

  if (!crouch)
  {
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
  }

  if (skipFrame == false) {
    LRHeadAngle += 0.01*(mouseX - width/2);
    UDHeadAngle +=  0.01*(mouseY - height/2);
  }
  if (UDHeadAngle > PI/2.5) UDHeadAngle = PI/2.5;
  if (UDHeadAngle < -PI/2.5) UDHeadAngle = -PI/2.5;

  focusX = eyeX + 600*cos(LRHeadAngle);
  focusZ = eyeZ + 600*sin(LRHeadAngle);
  focusY = eyeY + 600*tan(UDHeadAngle);
}

void draw()
{
  background(0);
  pushMatrix();

  crouch = false;
  if (ckey) //crouch/slide
  {
    crouch = true;
    //if (sprint) speed = 80;
    //else if (!jump) speed = 40;
    if (slidespeed > 0)
    {
      eyeX += slidespeed*cos(LRHeadAngle);
      eyeZ += slidespeed*sin(LRHeadAngle);
      if (eyeY >= height/2) slidespeed-=0.5;
    }

    if (eyeY < height/2+100)
    {
      //crouch = false;
      eyeY += 15;
    }
  } else if (eyeY > height/2)
  {
    crouch = true;
    eyeY -= 15;
    slidespeed = 50;
  } else slidespeed = 50;

  if (eyeY >= height/2)
  {
    if (spacekey) //jump
    {
      jump = true;
      speed += 20;
      spacekey = false;
    }
  }
  if (jump) //jump bool
  {
    eyeY -= jumpspeed;
    jumpspeed--;
  } else
  {
    jumpspeed = 50;
    //if (eyeY < height/2-50) eyeY += 50;
    if (!crouch) eyeY = height/2;
  }
  if (jumpspeed < 0 && eyeY >= height/2) jump = false;

  println(speed);

  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  drawFloor(11000, 400);
  drawFocalPoint();
  controlCamera();
  popMatrix();

  if (focused) rbt.warpPointer(width/2, height/2);

  drawCrosshair();
}

void drawFloor(int d, int s) //diameter, tilesize
{
  for (int x = floor(eyeX/s)-floor(d/s/2); x < floor(eyeX/s)+floor(d/s/2); x++)
  {
    for (int z = floor(eyeZ/s)-floor(d/s/2); z < floor(eyeZ/s)+floor(d/s/2); z++)
    {
      stroke(0);
      if (dist(x*s, z*s, eyeX, eyeZ) < d/2)
      {
        floorTile(x, height, z, s);
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

void drawCrosshair()
{
  if (sprint)
  {
    if (chdist < 20) chdist += 4;
  } else if (chdist > 8) chdist -= 4;

  fill(0);
  noStroke();
  pushMatrix();
  translate(width/2, height/2);
  //rotate(radians(45));
  fill(#ffffff);
  rect(0, chdist, 2, 8);
  rect(0, -chdist, 2, 8);
  rect(chdist, 0, 8, 2);
  rect(-chdist, 0, 8, 2);
  circle(0, 0, 3);
  popMatrix();
}

void floorTile(float x, float y, float z, float s)
{
  fill(#101010);
  stroke(#0bb1b7);
  beginShape(QUADS);
  vertex(x*s, y, z*s);
  vertex(x*s+s, y, z*s);
  vertex(x*s+s, y, z*s+s);
  vertex(x*s, y, z*s+s);
  endShape();
}
