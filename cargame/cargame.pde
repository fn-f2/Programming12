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

ArrayList<Car> myCars;
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
  
  //initialize cars
  myCars = new ArrayList();
  
  //initialize road lines
  myRoadLines = new ArrayList();
  
  Car1 = new Car(width/2-100);
  Car2 = new Car(width/2+100);
  
  myCars.add(Car1);
  myCars.add(Car2);
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
  
  Car1.updateKeys(wkey, akey, skey, dkey);
  Car2.updateKeys(upkey, leftkey, downkey, rightkey);
}
