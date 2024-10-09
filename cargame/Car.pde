class Car
{
  int lives;
  int xObCollide;
  int yObCollide;

  float x, y, r;
  float startX;
  float speed;
  float steerAngle;
  float maxAngle;
  float straightAngle;
  float ccollisionSpeed;
  float collisionAng;
  float scaleValue = 1;

  boolean fwd, left, back, right;
  boolean ccollide;
  boolean turnOut;
  boolean shouldScale;

  color c;

  Car hCar;

  Car(float startX, color c)
  {
    lives = 3;
    x = startX;
    y = height/2+100;
    r = 85/2;
    this.startX = startX;
    speed = 8;
    steerAngle = radians(270);
    maxAngle = radians(20);
    straightAngle = radians(270);
    ccollide = false;
    turnOut = false;
    this.c = c;
  }

  void show()
  {
    pushMatrix();
    translate(x, y);
    pushMatrix();
    scale(scaleValue);
    if (steerAngle > TWO_PI) steerAngle = 0;
    if (steerAngle < 0) steerAngle = TWO_PI;
    rotate(steerAngle);
    stroke(#000000);
    strokeWeight(8);
    fill(c);
    rect(0, 0, 100, 54);
    rect(-9, 0, 49, 39, 15);
    noStroke();
    popMatrix();
    popMatrix();
  }

  void act()
  {
    //movement
    if (!ccollide && !gameover)
    {
      if (fwd && yObCollide != 1)
      {
        if (y > 50) y -= speed;
      }

      if (left && xObCollide != 2)
      {
        if (steerAngle > straightAngle-maxAngle && steerAngle < straightAngle+radians(60)) steerAngle-=radians(3);
        x -= speed;
      } else if (steerAngle < straightAngle) steerAngle += radians(3);

      if (back)
      {
        if (y < height-50)y += speed;
      }

      if (right && xObCollide != 1)
      {
        if (steerAngle > straightAngle-radians(60) && steerAngle < straightAngle+maxAngle) steerAngle+=radians(3);
        x += speed;
      } else if (steerAngle > straightAngle) steerAngle -= radians(3);

      if (left && right)
      {
        if (steerAngle < straightAngle) steerAngle += radians(3);
        if (steerAngle > straightAngle) steerAngle -= radians(3);
      }
    }

    //shrink the car
    if (shouldScale && scaleValue > 0) scaleValue -= 0.05;

    //car collision
    if (ccollide) carCollision();
    else ccollisionSpeed = 15;

    //obstacle collision
    obCollision();
  }

  void carCollision()
  {
    x -= ccollisionSpeed*cos(collisionAng);
    if (y < height-50 && y > 50)
    {
      y -= ccollisionSpeed*sin(collisionAng);
    }

    if (ccollisionSpeed > 0) ccollisionSpeed -= 1;
    else
    {
      ccollide = false;
      ccollisionSpeed = 15;
    }
    if (turnOut)
    {
      if (x > hCar.x && steerAngle < straightAngle+maxAngle) steerAngle += radians(3);
      else if (x < hCar.x && steerAngle > straightAngle-maxAngle) steerAngle -= radians(3);
    }
  }

  void obCollision()
  {
    for (int i = 0; i < myObstacles.size(); i++)
    {
      //y collision
      if (x > myObstacles.get(i).x-50-30 //car x within range of obstacle x
        && x < myObstacles.get(i).x+50+30
        && y < height-45)
      {
        if (y-35 > myObstacles.get(i).y+myObstacles.get(i).h/2 && y-myObstacles.get(i).y < 50+myObstacles.get(i).h/2) //car touching obstacle
        {
          y = myObstacles.get(i).y+myObstacles.get(i).h/2+50;
          yObCollide = 1;
        } else if (y+35 < myObstacles.get(i).y-myObstacles.get(i).h/2 && myObstacles.get(i).y-y < 50+myObstacles.get(i).h/2)
        {
          y = myObstacles.get(i).y-myObstacles.get(i).h/2-50;
          yObCollide = 2;
        }
      } else yObCollide = 0; //no y collision

      //x collision
      if (y < myObstacles.get(i).y+myObstacles.get(i).h/2+45 && y > myObstacles.get(i).y-myObstacles.get(i).h/2) //check if car y is in range of obstacle y
      {
        if (x > myObstacles.get(i).x-50-30 && x < myObstacles.get(i).x+50+30) //if car overlaps w obstacle
        {
          if (x > myObstacles.get(i).x) //check right side
          {
            x = myObstacles.get(i).x+50+30;
            xObCollide = 2;
          } else //check left side
          {
            x = myObstacles.get(i).x-50-30;
            xObCollide = 1;
          }
        }
      } else xObCollide = 0; //no x collision
    }
    //println(startX, xObCollide);
  }

  void resetC()
  {
    ccollide = false;
    yObCollide = 0;
    xObCollide = 0;
    lives = 3;
    steerAngle = radians(270);
    x = startX;
    y = height/2+100;
    gameover = false;
    scaleValue = 1;
    shouldScale = false;
  }

  void setCollide(boolean c, Car car2)
  {
    if (x > car2.x) collisionAng = asin((y-car2.y)/dist(car2.x, car2.y, x, y))-PI;
    else collisionAng = -asin((y-car2.y)/dist(x, y, car2.x, car2.y));
    hCar = car2;
    if (abs(y-hCar.y) < 70)
    {
      turnOut = true;
    } else turnOut = false;
    ccollide = c;
  }

  void setLives(int l)
  {
    lives = l;
  }

  void updateKeys(boolean fwd, boolean left, boolean back, boolean right)
  {
    this.fwd = fwd;
    this.left = left;
    this.back = back;
    this.right = right;
  }
}
