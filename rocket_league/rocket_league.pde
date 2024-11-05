import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

//assets

PVector location;

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
  //load resources

  //initialise world
  makeWorld();

  //add terrain to world
  drawWalls();
  drawGround();
  drawBall();

  myCars = new ArrayList();

  car1 = new Car(ground, ball, 200, #0367FD);
  myCars.add(car1);

  car2 = new Car(ground, ball, width-200, #FE9900);
  myCars.add(car2);
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
  wall.vertex(width+90, height/2+110);
  wall.vertex(width+90, height/2-140);
  wall.vertex(width-50, height/2-140);
  wall.vertex(width-50, 0);

  //left goal
  wall.vertex(50, 0);
  wall.vertex(50, height/2-140);
  wall.vertex(-90, height/2-140);
  wall.vertex(-90, height/2+110);
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

void draw() {
  background(#AED3E0);

  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw

  drawCars();


  //detect goals
  if (ball.getX() > width+40)
  {
    ball.setVelocity(0, 0);
    ball.setPosition(width/2, height/2);
  }
  
  if (ball.getX() < -40)
  {
    ball.setVelocity(0, 0);
    ball.setPosition(width/2, height/2);
  }
  
  //fill(#000000);
  //text("jumps: " + car1.jumps + "        can jump: " + car1.canJump, width/2, height/2, 100);
}


//===========================================================================================

void drawBall() {
  ball = new FCircle(80);
  ball.setPosition(width/2, height/2);

  //set visuals
  ball.setStroke(0);
  ball.setNoStroke();
  ball.setFillColor(#909090);

  //set physical properties
  ball.setDensity(0.1);
  ball.setFriction(0);
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
    myCars.get(i).show();
    myCars.get(i).act();
  }
}
