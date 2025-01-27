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

PImage map, stone, dirt, diamond;

int gridSize;

color red, black, white, brown, orange, cyan;

ArrayList<GameObject> objects;

void setup()
{
  objects = new ArrayList();
  
  imageMode(CENTER);
  rectMode(CENTER);
  textureMode(NORMAL);

  red = #FF0000;
  black = #000000;
  white = #ffffff;
  brown = #B97A57;
  //orange = ;
  //cyan = ;

  //create canvases
  world = createGraphics(width, height, P3D);
  hud = createGraphics(width, height, P2D);

  map = loadImage("map.png");
  gridSize = 100;

  stone = loadImage("Stone_Bricks.png");
  dirt = loadImage("dirt.png");
  dirt.resize(120, 120);
  diamond = loadImage("Diamond.png");
  diamond.resize(120, 120);

  //fullScreen(P3D);
  size(600, 600, P2D);
  world.textureMode(NORMAL);
  world.rectMode(CENTER);
  world.perspective();
  noCursor();

  rbt = (GLWindow)surface.getNative();
  rbt.confinePointer(true);

  eyeX = width/2;
  eyeY = 75*height/100;
  eyeZ = height/2;
  focusX = width/2;
  focusY = width/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;

  speed = 10;
}

boolean canMoveForward()
{
  float fwdx, fwdz, lx, lz, rx, rz;
  int mapx, mapy, maplx, maply, maprx, mapry;
  fwdx = eyeX + 150*cos(LRHeadAngle);
  lx = eyeX + 150*cos(LRHeadAngle+radians(20)+radians(0));
  rx = eyeX + 150*cos(LRHeadAngle-radians(20)+radians(0));
  fwdz = eyeZ + 150*sin(LRHeadAngle);
  lz = eyeZ + 150*sin(LRHeadAngle+radians(20)+radians(0));
  rz = eyeZ + 150*sin(LRHeadAngle-radians(20)+radians(0));
  mapx = int(fwdx+2000-gridSize)/gridSize;
  mapy = int(fwdz+2000-gridSize)/gridSize;
  maplx = int(lx+2000-gridSize)/gridSize;
  maply = int(lz+2000-gridSize)/gridSize;
  maprx = int(rx+2000-gridSize)/gridSize;
  mapry = int(rz+2000-gridSize)/gridSize;
  
  if (map.get(mapx, mapy) == white && map.get(maplx, maply) == white && map.get(maprx, mapry) == white) return true;
  else return false;
}

void controlCamera()
{
  if (wkey && canMoveForward())
  {
    eyeX += speed*cos(LRHeadAngle);
    eyeZ += speed*sin(LRHeadAngle);
  }
  if (skey && canMoveBackward())
  {
    eyeX -= speed*cos(LRHeadAngle);
    eyeZ -= speed*sin(LRHeadAngle);
  }
  if (akey && canMoveLeft())
  {
    eyeX -= speed*cos(LRHeadAngle + PI/2);
    eyeZ -= speed*sin(LRHeadAngle + PI/2);
  }
  if (dkey && canMoveRight())
  {
    eyeX -= speed*cos(LRHeadAngle - PI/2);
    eyeZ -= speed*sin(LRHeadAngle - PI/2);
  }
  LRHeadAngle += 0.01*(mouseX - width/2);
  UDHeadAngle +=  0.01*(mouseY - height/2);
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
  world.pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  controlCamera();
  snowball();
  drawFloor(2000, height, gridSize);
  drawFloor(2000, height-gridSize*4, gridSize);
  drawMap();
  
  int i = 0;
  while (i < objects.size())
  {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives < 1) objects.remove(i);
    else i++;
  }
  
  world.popMatrix();
  world.endDraw();
  image(world, width/2, height/2);

  if (focused) rbt.warpPointer(width/2, height/2);

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
      if (c != white)
      {
        if (c == black || c == red)
        {
          texturedCube(x*gridSize-2000+gridSize, height-gridSize, y*gridSize-2000+gridSize, stone, gridSize);
          texturedCube(x*gridSize-2000+gridSize, height-gridSize*2, y*gridSize-2000+gridSize, stone, gridSize);
          texturedCube(x*gridSize-2000+gridSize, height-gridSize*3, y*gridSize-2000+gridSize, stone, gridSize);
        } else if (c == brown)
        {
          texturedCube(x*gridSize-2000+gridSize, height-gridSize, y*gridSize-2000+gridSize, dirt, gridSize);
          texturedCube(x*gridSize-2000+gridSize, height-gridSize*2, y*gridSize-2000+gridSize, dirt, gridSize);
          texturedCube(x*gridSize-2000+gridSize, height-gridSize*3, y*gridSize-2000+gridSize, dirt, gridSize);
        }
      }
    }
  }
}

void drawFloor(int w, int y, int gs)
{
  world.stroke(255);
  world.strokeWeight(1);
  int x = w;
  int z = w;
  while (z > -w)
  {
    texturedCube(x, y, z, diamond, gs);

    x -= gs;
    if (x <= -w)
    {
      x = w;
      z -= gs;
    }
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
