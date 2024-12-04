import fisica.*;

//palette
color black = #000000;
color grey = #464646;
color white = #ffffff;
color cyan = #00b7ef;
color lime = #a8e61d;
color green = #22b14c;
color brown = #9c5a3c;

PImage map, ice, wood;
int gridSize = 18;
int maprotation = 1;
float zoom = 1;

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

boolean rotating;

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
  wood = loadImage("tree_trunk.png");
  ice.resize(gridSize, gridSize);
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
  if (qkey) maprotation += radians(2);
  if (ekey) maprotation -= radians(2);
  world.setGravity(0, 900);
  scale(zoom);
  //rotate(maprotation);
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height*.7);
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
      color c = img.get(x, y); //color of current pixel
      color s = img.get(x, y+1); //color below current pixel
      color w = img.get(x-1, y); // color west of current pixel
      color e = img.get(x+1, y); // color east of current pixel

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
      } else if (c == brown)
      {
        FBox b = new FBox(gridSize+1, gridSize+1);
        b.attachImage(wood);
        b.setNoStroke();
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setFriction(0.5);
        b.setName("treetrunk");
        world.add(b);
      }
      if (c == green)
      {
        FBox b = new FBox(gridSize+1, gridSize+1);
        if (s != green) b.attachImage(wood);
        b.setNoStroke();
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setFriction(0.5);
        b.setName("treetop");
        world.add(b);
      }
    }
  }
}
