//Carter Kwong
//1-4
//sept 17, 2024

//MODE VARIABLES
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//KEYBOARD VARIABLES
boolean wkey;
boolean akey;
boolean skey;
boolean dkey;

boolean upkey;
boolean leftkey;
boolean downkey;
boolean rightkey;

//COLOUR VARIABLES
color bgcol;

Car Car1;
Car Car2;

ArrayList<roadLine> myRoadLines;

void setup()
{
  size(1000, 600);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  mode = GAME;
  
  colorMode(HSB);
  bgcol = color(random(0, 255), 180, 180);
  colorMode(RGB);
  
  Car1 = new Car();
  Car2 = new Car();
  
  //initialize road lines
  myRoadLines = new ArrayList();
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
  default:
    println("ERROR: Mode = " + mode);
    break;
  }
}
