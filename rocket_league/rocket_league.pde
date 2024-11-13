import fisica.*;

//MODE VARIABLES
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//palette
color blue = #0367FD;
color orange = #FD7507;

//assets
PVector location;

int score1, score2 = 0;
int timer = 0;

//mouse
boolean mouseReleased;
boolean wasPressed;

//keyboard
boolean wkey;
boolean akey;
boolean skey;
boolean dkey;

boolean wkeyReleased;
boolean wkeyWasPressed;

boolean upkey;
boolean leftkey;
boolean downkey;
boolean rightkey;

//buttons
ArrayList<Car> myCars;

Button playBtn;

Car car1;
Car car2;

FPoly ground;
FPoly wall;
FCircle ball;
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  fullScreen();

  rectMode(CENTER);
  textAlign(CENTER, CENTER);

  //initialise world
  makeWorld();

  //add terrain to world
  drawWalls();
  drawGround();
  drawBall();

  playBtn = new Button("PLAY", width/2, height*0.7, 300, 100, #ffffff, #000000);

  myCars = new ArrayList();

  car1 = new Car(ground, ball, 200, blue);
  myCars.add(car1);

  car2 = new Car(ground, ball, width-200, orange);
  myCars.add(car2);

  mode = INTRO;
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  //world.setEdges(50);
  world.setGravity(0, 300);
}

//===========================================================================================

void drawGround() {
  ground = new FPoly();

  //plot the vertices of this platform
  ground.vertex(0, height);
  ground.vertex(width, height);
  ground.vertex(width, height-50);
  ground.vertex(0, height-50);

  // define properties
  ground.setStatic(true);
  ground.setGrabbable(false);
  ground.setNoStroke();
  ground.setFillColor(#58673E);
  ground.setFriction(0.1);

  //put it in the world
  world.add(ground);
}


void drawWalls()
{
  wall = new FPoly();

  wall.vertex(-200, height);
  wall.vertex(-200, -50);
  wall.vertex(width+200, -50);
  wall.vertex(width+200, height);

  //right curve
  wall.vertex(width-150, height-50);
  wall.vertex(width-105, height-65);
  wall.vertex(width-65, height-105);
  wall.vertex(width-50, height-150);

  //right goal
  wall.vertex(width-50, height/2+110);
  wall.vertex(width+110, height/2+110);
  wall.vertex(width+110, height/2-140);
  wall.vertex(width-50, height/2-140);
  wall.vertex(width-50, 0);

  //left goal
  wall.vertex(50, 0);
  wall.vertex(50, height/2-140);
  wall.vertex(-110, height/2-140);
  wall.vertex(-110, height/2+110);
  wall.vertex(50, height/2+110);

  //left curve
  wall.vertex(50, height-150);
  wall.vertex(65, height-105);
  wall.vertex(105, height-65);
  wall.vertex(150, height-50);

  // define properties
  wall.setStatic(true);
  wall.setGrabbable(false);
  wall.setNoStroke();
  wall.setFillColor(#505050);
  wall.setFriction(0.1);

  //put it in the world
  world.add(wall);
}

//===========================================================================================

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


//===========================================================================================

void drawBall() {
  ball = new FCircle(100);
  ball.setPosition(width/2, height*0.87);

  //set visuals
  ball.setStroke(0);
  ball.setNoStroke();
  ball.setFillColor(#909090);

  //set physical properties
  ball.setDensity(0.1);
  ball.setFriction(1);
  ball.setRestitution(1);
  ball.setGrabbable(false);

  //add to world
  world.add(ball);
}

void drawCars()
{
  car1.updateKeys(wkey, skey, akey, dkey);
  car2.updateKeys(upkey, downkey, leftkey, rightkey);

  for (int i = 0; i < myCars.size(); i++)
  {
    myCars.get(i).act();
    myCars.get(i).show();
  }
}
