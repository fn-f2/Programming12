import fisica.*;

//palette
color black = #000000;
color white = #ffffff;

PImage map;
int gridSize = 18;

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


//fisica
FWorld world;

void setup()
{
  size(600, 600);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  Fisica.init(this);
  
  map = loadImage("testmap.png");
  loadWorld(map);
}

void draw()
{
  world.step();
  world.draw();
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
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
      }
    }
  }
}
