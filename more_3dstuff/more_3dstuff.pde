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

//canvases
PGraphics world;
PGraphics hud;

PImage map, stone;

int gridSize;

void setup()
{
  imageMode(CENTER);
  rectMode(CENTER);
  textureMode(NORMAL);

  //create canvases
  world = createGraphics(width, height, P3D);
  hud = createGraphics(width, height, P2D);

  map = loadImage("map.png");
  gridSize = 100;

  stone = loadImage("Stone_Bricks.png");

  //fullScreen(P3D);
  size(600, 600, P2D);
  world.textureMode(NORMAL);
  world.rectMode(CENTER);
  world.perspective();
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

  speed = 10;
}

void controlCamera()
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
  world.beginDraw();
  world.background(0);
  world.pushMatrix();

  world.camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  controlCamera();
  drawFloor();
  drawMap();
  world.popMatrix();

  if (focused) rbt.warpPointer(width/2, height/2);

  world.endDraw();
  image(world, width/2, height/2);

  hud.beginDraw();
  drawCrosshair();
  hud.endDraw();
  image(hud, width/2, height/2);
}

void drawMap()
{
  for (int x = 0; x < map.width; x++)
  {
    for (int y = 0; y < map.height; y++)
    {
      color c = map.get(x, y);
      if (c != #ffffff)
      {
        world.pushMatrix();
        world.fill(c);
        world.translate(x*gridSize-2000+gridSize/2, height/2, y*gridSize-2000+gridSize/2);
        world.box(gridSize, height, gridSize);
        world.popMatrix();
      }
    }
  }
}

void drawFloor()
{
  world.stroke(255);
  for (int i = -2000; i <= 2000; i += 100)
  {
    world.line(i, height, -2000, i, height, 2000);
    world.line(-2000, height, i, 2000, height, i);
  }
  world.stroke(255);
  for (int i = -2000; i <= 2000; i += 100)
  {
    world.line(i, 0, -2000, i, 0, 2000);
    world.line(-2000, 0, i, 2000, 0, i);
  }
}

void drawCrosshair()
{
  hud.background(0, 0);
  hud.fill(0);
  hud.noStroke();
  hud.pushMatrix();
  hud.rectMode(CENTER);
  hud.translate(width/2, height/2);
  hud.fill(#ffffff);
  hud.rect(0, 8, 2, 8);
  hud.rect(0, -8, 2, 8);
  hud.rect(8, 0, 8, 2);
  hud.rect(-8, 0, 8, 2);
  hud.circle(0, 0, 3);
  hud.popMatrix();
}
