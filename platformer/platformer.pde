import fisica.*;

//palette
color black = #000000;
color grey = #464646;
color white = #ffffff;
color cyan = #00b7ef;
color lime = #a8e61d;
color green = #22b14c;

PImage map, ice;
int gridSize = 18;

float maprotation = 0;
float zoom = 2;

//mouse
boolean mouseReleased, wasPressed;

//keyboard
boolean wkey;
boolean akey;
boolean skey;
boolean dkey;
boolean qkey;
boolean ekey;


boolean upkey;
boolean leftkey;
boolean downkey;
boolean rightkey;

FPlayer player;

//fisica
FWorld world;

void setup()
{
  size(600, 600);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  Fisica.init(this);

  map = loadImage("map.png");
  ice = loadImage("blueBlock.png");
  loadWorld(map);
  loadPlayer();
}

void draw()
{
  background(#ffffff);
  drawWorld();
  player.act();
}

void drawWorld()
{
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height*0.7);
  if (qkey) maprotation += radians(0);
  if (ekey) maprotation -= radians(0);
  world.setGravity(900*sin(maprotation), 900*cos(maprotation));
  rotate(maprotation);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

void loadPlayer()
{
  player = new FPlayer();
  world.add(player);
}

void loadWorld(PImage img)
{
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y = 0; y < map.height; y++)
  {
    for (int x = 0; x < map.width; x++)
    {
      color c = img.get(x, y);
      if (c == black)
      {
        FBox b = new FBox(gridSize+1, gridSize+1);
        b.setFillColor(black);
        b.setNoStroke();
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setFriction(3);
        b.setName("ground");
        world.add(b);
      } else if (c == cyan)
      {
        FBox b = new FBox(gridSize+1, gridSize+1);
        b.attachImage(ice);
        b.setNoStroke();
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setFriction(0);
        b.setName("ice");
        world.add(b);
      } else if (c == grey)
      {
        FBox b = new FBox(gridSize+1, gridSize+1);
        b.setFillColor(grey);
        b.setNoStroke();
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setRestitution(1);
        b.setFriction(0.5);
        b.setName("trampoline");
        world.add(b);
      }
    }
  }
}
