import fisica.*;

//palette
color black = #000000;
color white = #ffffff;

PImage map;
int gridSize = 32;

//keyboard
boolean wkey;
boolean akey;
boolean skey;
boolean dkey;

boolean upkey;
boolean leftkey;
boolean downkey;
boolean rightkey;


//fisica
FWorld world;

void setup()
{
  size(1000, 600);
  Fisica.init(this);
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  map = loadImage("testmap.png");

  for (int y = 0; y < map.height; y++)
  {
    for (int x = 0; x < map.width; x++)
    {
      color c = map.get(x, y);
      if (c == black)
      {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
      }
    }
  }
}

void draw()
{
  world.step();
  world.draw();
}
