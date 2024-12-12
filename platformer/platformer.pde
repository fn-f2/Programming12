import fisica.*;

//palette
color black = #000000;
color grey = #464646;
color white = #ffffff;
color cyan = #00b7ef;
color purple = #c60dd3;
color green = #a8e61d;
color brown = #9c5a3c;
color darkbrown = #502713;

PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] action;

PImage map, ice, treetrunk, treetopc, treetope, treetopw, treetopi, stone, spike, bridge;

int gridSize = 18;
int maprotation = 1;
float zoom = 1.5;

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

boolean isgrounded;

boolean rotating;

ArrayList<FGameObject> terrain;
FPlayer player;


//fisica
FWorld world;

void setup()
{
  size(600, 600);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  Fisica.init(this);

  terrain = new ArrayList();

  map = loadImage("map.png");
  ice = loadImage("blueBlock.png");
  ice.resize(gridSize, gridSize);
  treetrunk = loadImage("tree_trunk.png");
  treetrunk.resize(gridSize, gridSize);
  treetopc = loadImage("treetop_center.png");
  treetopc.resize(gridSize, gridSize);
  treetope = loadImage("treetop_e.png");
  treetope.resize(gridSize, gridSize);
  treetopw = loadImage("treetop_w.png");
  treetopw.resize(gridSize, gridSize);
  treetopi = loadImage("tree_intersect.png");
  treetopi.resize(gridSize, gridSize);
  spike = loadImage("spike.png");
  spike.resize(gridSize, gridSize);
  stone = loadImage("brick.png");
  stone.resize(gridSize, gridSize);
  bridge = loadImage("bridge_center.png");
  bridge.resize(gridSize, gridSize);
  loadWorld(map);
  loadPlayer();
}

void draw()
{
  background(#ffffff);
  drawWorld();
  actWorld();
}

void drawWorld()
{
  pushMatrix();
  if (qkey) maprotation += radians(2);
  if (ekey) maprotation -= radians(2);
  world.setGravity(0, 900);
  //rotate(maprotation);
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height*.7);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

void actWorld()
{
  player.act();
  for (int i = 0; i < terrain.size(); i++)
  {
    FGameObject t = terrain.get(i);
    t.act();
  }
}

void loadPlayer()
{

  //Load Sprites
  idle = new PImage[2];
  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");
for (int i = 0; i < idle.length; i++) idle[i].resize(gridSize, gridSize);


  jump = new PImage[1];
  jump[0] = loadImage("jump0.png");
for (int i = 0; i < jump.length; i++) jump[i].resize(gridSize, gridSize);

  run = new PImage[3];
  run[0] = loadImage("runright0.png");
  run[1] = loadImage("runright1.png");
  run[2] = loadImage("runright2.png");
//for (int i = 0; i < run.length; i++) run[i].resize(gridSize, gridSize);


  action = idle;

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
      //if (c == black || c == cyan || c == grey || c == green || c == brown)
      if (c!=color (0, 0))
      {
        FBox b = new FBox(gridSize+1, gridSize+1);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setNoStroke();

        if (c == black)
        {
          b.attachImage(stone);
          b.setFriction(3);
          b.setName("stone");
          world.add(b);
        } else if (c == cyan)
        {
          b.attachImage(ice);
          b.setFriction(0);
          b.setName("ice");
          world.add(b);
        } else if (c == grey)
        {
          b.setRestitution(1);
          b.setFriction(0.5);
          b.setFillColor(grey);
          b.setName("trampoline");
          world.add(b);
        } else if (c == brown)
        {
          b.attachImage(treetrunk);
          b.setFriction(0.5);
          b.setSensor(true);
          b.setName("treetrunk");
          world.add(b);
        } else if (c == green)
        {
          if (e == green && w == green && s != brown) b.attachImage(treetopc);
          else if (e != green && w == green) b.attachImage(treetope);
          else if (e == green && w != green) b.attachImage(treetopw);
          else if (e == green && w == green && s == brown) b.attachImage(treetopi);
          b.setFriction(0.5);
          b.setName("treetop");
          world.add(b);
        } else if (c == purple)
        {
          b.attachImage(spike);
          b.setName("spike");
          world.add(b);
        } else if (c == darkbrown)
        {
          FBridge br = new FBridge(x*gridSize, y*gridSize);
          terrain.add(br);
          world.add(br);
        }
      }
    }
  }
}
