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
FCircle ball;
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  fullScreen();
  //size(1920, 1080);
  //load resources

  //initialise world
  makeWorld();

  //add terrain to world
  makeGround();
  drawBall();
  
  myCars = new ArrayList();
  
  car1 = new Car(ground, ball, 100);
  myCars.add(car1);
  
  car2 = new Car(ground, ball, width-100);
  myCars.add(car2);
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
  world.setGravity(0, 300);
}

//===========================================================================================

void makeGround() {
  ground = new FPoly();

  //plot the vertices of this platform
  ground.vertex(0, height);
  ground.vertex(width, height);
  ground.vertex(width, height*0.9);
  ground.vertex(0, height*0.9);

  // define properties
  ground.setStatic(true);
  ground.setGrabbable(false);
  ground.setFillColor(brown);
  ground.setFriction(0.1);

  //put it in the world
  world.add(ground);
}

//===========================================================================================

void draw() {
  background(blue);

  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
  
  drawCars();
  
  wkeyCheck();
  
  fill(#000000);
  text("jumps: " + car1.jumps + "        can jump: " + car1.canJump, width/2, height/2, 100);
}


//===========================================================================================

void drawBall() {
  FCircle ball = new FCircle(80);
  ball.setPosition(random(width*0.05+50, width*0.95-50), -5);

  //set visuals
  ball.setStroke(0);
  ball.setStrokeWeight(0);
  ball.setFillColor(red);

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
  
  //for (int i = 0; i > myCars.size(); i++)
  //{
  //  myCars.get(i).show();
  //  myCars.get(i).act();
  //}
  car1.show();
  car1.act();
  car2.show();
  car2.act();
  
}
