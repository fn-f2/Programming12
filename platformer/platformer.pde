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

PImage map, map2, ice, treetrunk, treetopc, treetope, treetopw, treetopi, stone, spiken, spikee, spikes, spikew, spikene, spikese, spikesw, spikenw, spikebn, spikebe, spikebs, spikebw, bridge, turret, fire, keyimg;

int gridSize = 18;
int mrotation = 1;
int prevmrotation;
float mapangle = 0;
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

boolean qReleased;
boolean eReleased;
boolean qWasPressed;
boolean eWasPressed;


boolean upkey;
boolean leftkey;
boolean downkey;
boolean rightkey;

boolean isgrounded;

boolean rotating;

boolean unlocked;

ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;

FPlayer player;

int level;

int mode;

Button play, quit, level1, level2, level3, back, resume, exit;

final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
final int LVLSELECT = 5;
//fisica
FWorld currentWorld;

void setup()
{
  size(600, 600);
  noSmooth();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  Fisica.init(this);

  map = loadImage("map.png");
  map2 = loadImage("map2.png");
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
  spiken = loadImage("spike.png");
  spiken.resize(gridSize, gridSize);
  spikee = loadImage("spikee.png");
  spikee.resize(gridSize, gridSize);
  spikes = loadImage("spikes.png");
  spikes.resize(gridSize, gridSize);
  spikew = loadImage("spikew.png");
  spikew.resize(gridSize, gridSize);
  spikene = loadImage("spikene.png");
  spikene.resize(gridSize, gridSize);
  spikese = loadImage("spikese.png");
  spikese.resize(gridSize, gridSize);
  spikesw = loadImage("spikesw.png");
  spikesw.resize(gridSize, gridSize);
  spikenw = loadImage("spikenw.png");
  spikenw.resize(gridSize, gridSize);
  spikebn = loadImage("spikeb.png");
  spikebn.resize(gridSize, gridSize);
  spikebe = loadImage("spikebe.png");
  spikebe.resize(gridSize, gridSize);
  spikebs = loadImage("spikebs.png");
  spikebs.resize(gridSize, gridSize);
  spikebw = loadImage("spikebw.png");
  spikebw.resize(gridSize, gridSize);
  stone = loadImage("brick.png");
  stone.resize(gridSize, gridSize);
  bridge = loadImage("bridge_center.png");
  bridge.resize(gridSize, gridSize);
  turret = loadImage("turret.png");
  turret.resize(gridSize, gridSize);
  fire = loadImage("fire.png");
  fire.resize(gridSize, gridSize);
  keyimg = loadImage("key.png");
  keyimg.resize(gridSize, gridSize);
  loadWorld("map.png");
  loadPlayer(100, 520);

  level = 1;

  mode = INTRO;

  noStroke();
  play = new Button("P L A Y", width/2, height/2, 200, 100, #8ab7ff, #f0f0f0);
  quit = new Button("Q U I T", width/2, height/2+150, 200, 100, #8ab7ff, #f0f0f0);
  level1 = new Button("0 1", width*0.2, 180, 150, 100, #8ab7ff, #f0f0f0);
  level2 = new Button("0 2", width/2, 180, 150, 100, #8ab7ff, #f0f0f0);
  level3 = new Button("0 3", width*0.8, 180, 150, 100, #8ab7ff, #f0f0f0);
  back = new Button("B A C K", 100, height-50, 120, 50, #8ab7ff, #f0f0f0);
  resume = new Button("R E S U M E", width/2, height/2-100, 130, 80, #8ab7ff, #f0f0f0);
  exit = new Button("E X I T", width/2, height/2, 130, 80, #8ab7ff, #f0f0f0);
}

void draw()
{
  switch (mode)
  {
  case INTRO:
    intro();
    break;
  case GAME:
    game();
    break;
  case PAUSE:
    pause();
    break;
  case GAMEOVER:
    gameover();
    break;
  case LVLSELECT:
    lvlselect();
    break;
  default:
    println("ERROR: Mode = " + mode);
    break;
  }
}

void drawWorld()
{
  if (mapangle > radians(358)) mapangle = 0;
  if (mapangle < 0) mapangle = radians(358);
  pushMatrix();
  if (mrotation == 1) currentWorld.setGravity(0, 900);
  if (mrotation == 2) currentWorld.setGravity(900, 0);
  if (mrotation == 3) currentWorld.setGravity(0, -900);
  if (mrotation == 4) currentWorld.setGravity(-900, 0);
  translate(width/2, height/2);
  rotate(mapangle);
  translate(-player.getX()*zoom, -player.getY()*zoom);
  scale(zoom);
  currentWorld.step();
  currentWorld.draw();
  popMatrix();
  textSize(20);
  //text("angle: "+round(degrees(mapangle))+" rotation: "+mrotation, width/2, height/2);
}

void actWorld()
{
  if (player.isGrounded())
  {
    if (ekey)
    {
      ekey = false;
      prevmrotation = mrotation;
      if (mrotation < 4) mrotation++;
      else mrotation = 1;
    }
    if (qkey)
    {
      qkey = false;
      prevmrotation = mrotation;
      if (mrotation > 1) mrotation--;
      else mrotation = 4;
    }
  }
  //MAP ROTATION========================================================================================================================================
  if (mrotation == 1) //MAP ROTATION 1
  {
    if (mapangle > radians(2) && mapangle < radians(358)) //check angle
    {
      if (prevmrotation == 4) mapangle += radians(10);
      else if (prevmrotation == 2) mapangle -= radians(10);
    } else mapangle = 0;
  } else if (mrotation == 2) //MAP ROTATION 2
  {
    if (mapangle > radians(92) || mapangle < radians(88)) //check angle
    {
      if (prevmrotation == 1) mapangle += radians(10);
      else if (prevmrotation == 3) mapangle -= radians(10);
    } else mapangle = radians(90);
  } else if (mrotation == 3) //MAP ROTATION 3
  {
    if (mapangle > radians(182) || mapangle < radians(178)) //check angle
    {
      if (prevmrotation == 2) mapangle += radians(10);
      else if (prevmrotation == 4) mapangle -= radians(10);
    } else mapangle = radians(180);
  } else if (mrotation == 4) //MAP ROTATION 4
  {
    if (mapangle > radians(272) || mapangle < radians(268)) //check angle
    {
      if (prevmrotation == 3) mapangle += radians(10);
      else if (prevmrotation == 1) mapangle -= radians(10);
    } else mapangle = radians(270);
  }

  fill(0);
  player.act();
  for (int i = 0; i < terrain.size(); i++)
  {
    FGameObject t = terrain.get(i);
    t.act();
  }

  for (int i = 0; i < enemies.size(); i++)
  {
    FGameObject e = enemies.get(i);
    e.act();
  }
}

void loadPlayer(float x, float y)
{

  //Load Sprites
  idle = new PImage[8];
  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");
  idle[2] = loadImage("idle2.png");
  idle[3] = loadImage("idle3.png");
  idle[4] = loadImage("idle4.png");
  idle[5] = loadImage("idle5.png");
  idle[6] = loadImage("idle6.png");
  idle[7] = loadImage("idle7.png");
  for (int i = 0; i < idle.length; i++) idle[i].resize(gridSize*2, gridSize*2);


  jump = new PImage[1];
  jump[0] = loadImage("jump0.png");
  for (int i = 0; i < jump.length; i++) jump[i].resize(gridSize, gridSize);

  run = new PImage[3];
  run[0] = loadImage("runright0.png");
  run[1] = loadImage("runright1.png");
  run[2] = loadImage("runright2.png");
  for (int i = 0; i < run.length; i++) run[i].resize(gridSize, gridSize);


  action = idle;

  player = new FPlayer(x, y);
  currentWorld.add(player);
}

void loadWorld(String img)
{
  unlocked = false;
  currentWorld = new FWorld(-2000, -2000, 2000, 2000);
  currentWorld.setGravity(0, 900);

  terrain = new ArrayList();
  enemies = new ArrayList();
  map = loadImage(img);

  for (int y = 0; y < map.height; y++)
  {
    for (int x = 0; x < map.width; x++)
    {
      color c = map.get(x, y); //color of current pixel
      color n = map.get(x, y-1);
      color s = map.get(x, y+1); //color below current pixel
      color w = map.get(x-1, y); // color west of current pixel
      color e = map.get(x+1, y); // color east of current pixel
      //if (c == black || c == cyan || c == grey || c == green || c == brown)
      if (c!=color (0, 0))
      {
        FGameObject b = new FGameObject();
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setNoStroke();

        if (c == black)
        {
          //b.attachImage(stone);
          b.setFillColor(#ffffff);
          b.setFriction(3);
          b.setName("stone");
          currentWorld.add(b);
        } else if (c == cyan)
        {
          b.attachImage(ice);
          b.setFriction(0);
          b.setName("ice");
          currentWorld.add(b);
        } else if (c == grey)
        {
          b.setRestitution(1);
          b.setFriction(0.5);
          b.setFillColor(grey);
          b.setName("trampoline");
          currentWorld.add(b);
        } else if (c == brown)
        {
          b.attachImage(treetrunk);
          b.setFriction(0.5);
          b.setSensor(true);
          b.setName("treetrunk");
          currentWorld.add(b);
        } else if (c == green)
        {
          PImage timg = treetopc;
          if (e == green && w == green && s != brown) timg = treetopc;
          else if (e != green && w == green) timg = treetope;
          else if (e == green && w != green) timg = treetopw;
          else if (e == green && w == green && s == brown) timg = treetopi;
          FFloatPlat tt = new FFloatPlat(x*gridSize, y*gridSize, "treetop", timg);
          terrain.add(tt);
          currentWorld.add(tt);
        } else if (c == purple) //spike
        {
          PImage spike = spiken;

          if ((n == black && e == black) || (s == black && e == black) || (n == black && w == black) || (s == black && w == black)) //if connected to two ground blocks
          {
            if (n == purple && e == purple) spike = spikene; //if connected to two spikes
            else if (s == purple && e == purple) spike = spikese;
            else if (s == purple && w == purple) spike = spikesw;
            else if (n == purple && w == purple) spike = spikenw;
            else if (n == purple) //if only connected to one spike
            {
              if (w == black) spike = spikee;
              else spike = spikew;
            } else if (e == purple)
            {
              if (n == black) spike = spikes;
              else spike = spiken;
            } else if (s == purple)
            {
              if (e == black) spike = spikew;
              else spike = spikee;
            } else if (w == purple)
            {
              if (s == black) spike = spiken;
              else spike = spikes;
            }
          } else if (n == black) spike = spikes; //if only connected to one ground block
          else if (e == black) spike = spikew;
          else if (s == black) spike = spiken;
          else if (w == black) spike = spikee;

          b.attachImage(spike);
          b.setName("spike");
          terrain.add(b);
          currentWorld.add(b);
        } else if (c == darkbrown)
        {
          FBridge br = new FBridge(x*gridSize, y*gridSize); //bridge
          terrain.add(br);
          currentWorld.add(br);
        } else if (c == #ff8716)
        {
          finishBlock fb = new finishBlock(x*gridSize, y*gridSize); //finish block
          currentWorld.add(fb);
        } else if (c == #ff0000)
        {
          Turret trt = new Turret(x*gridSize, y*gridSize); //turret
          enemies.add(trt);
          currentWorld.add(trt);
        } else if (c == #424242)
        {
          b.setName("wall"); //wall
          b.setFillColor(#ffffff);
          currentWorld.add(b);
        }
        else if (c == #1500ff)
        {
          FMovingPlat mp = new FMovingPlat(x*gridSize, y*gridSize); //moving platform
          terrain.add(mp);
          currentWorld.add(mp);
        } else if (c == #ffffff)
        {
          PImage lock = spikebn;
          
          if (n == black || n == #ff8716) lock = spikebs;
          else if (e == black || e == #ff8716) lock = spikebw;
          else if (s == black || s == #ff8716) lock = spikebn;
          else if (w == black || w == #ff8716) lock = spikebe;
          
          Lock l = new Lock(x*gridSize, y*gridSize, lock); //lock
          terrain.add(l);
          currentWorld.add(l);
        } else if (c == #262626)
        {
          Key k = new Key(x*gridSize, y*gridSize); //lock
          terrain.add(k);
          currentWorld.add(k);
        }
      }
    }
  }
}
