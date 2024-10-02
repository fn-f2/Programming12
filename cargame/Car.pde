class Car
{
  int lives;

  float x, y, r;
  float startX;
  float speed;
  float steerAngle;
  float maxAngle;
  float straightAngle;
  float ccollisionSpeed;
  float collisionAng;

  boolean fwd, left, back, right;
  boolean ccollide, ocollide;
  boolean turnOut;

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
      if (fwd)
      {
        if (y > 50) y -= speed;
      }

      if (left)
      {
        if (steerAngle > straightAngle-maxAngle && steerAngle < straightAngle+radians(60)) steerAngle-=radians(3);
        x -= speed;
      } else if (steerAngle < straightAngle) steerAngle += radians(3);

      if (back)
      {
        if (y < height-50)y += speed;
      }

      if (right)
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

    //car collision
    if (ccollide) carCollision();
    else ccollisionSpeed = 15;
    
    //obstacle collision
    if (ocollide) obCollision();
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
  
  }

  void resetC()
  {
    ccollide = false;
    lives = 3;
    steerAngle = radians(270);
    x = startX;
    y = height/2+100;
    gameover = false;
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
