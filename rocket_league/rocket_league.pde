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



Car car1;

FPoly ground; 
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
  makeGround();
  makeCircle();
  
  car1 = new Car(ground);
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
  world.setGravity(0, 600);
}

//===========================================================================================

void makeGround() {
  ground = new FPoly();

  //plot the vertices of this platform
  ground.vertex(0, height*.9);
  ground.vertex(0, height);
  ground.vertex(width, height);
  ground.vertex(width, height*.9);

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
}


//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(100);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(0);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.1);
  circle.setFriction(0);
  circle.setRestitution(1);
  circle.setGrabbable(false);
  
  //add to world
  world.add(circle);
}

void drawCars()
{
  car1.show();
  car1.act();
}
