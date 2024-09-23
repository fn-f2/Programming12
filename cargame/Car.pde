class Car
{
  int lives;

  float x, y;
  float startX;
  float speed;
  float steerAngle;
  float maxAngle;
  float straightAngle;
  boolean fwd, left, back, right;
  boolean collide;

  Car(float startX)
  {
    lives = 3;
    x = startX;
    y = height/2;
    this.startX = startX;
    speed = 8;
    steerAngle = radians(270);
    maxAngle = radians(20);
    straightAngle = radians(270);
    collide = false;
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
    strokeWeight(13);
    fill(#ffffff);
    rect(-18, 0, 124, 66);
    noStroke();
    fill(#ff0000);
    circle(-19, 0, 100);
    popMatrix();
    //fill(#000000);
    //textSize(20);
    //text(degrees(steerAngle), 0, 0);
    popMatrix();
  }

  void act()
  {
    if (!collide)
    {
      //movement
      if (fwd)
      {
        //y+=speed*sin(angle);
        //x+=speed*cos(angle);
        if (y > 50) y -= speed;
      }

      if (left)
      {
        if (steerAngle > straightAngle-maxAngle && steerAngle < straightAngle+radians(60)) steerAngle-=radians(3);
        x -= speed;
      } else if (steerAngle < straightAngle) steerAngle += radians(3);

      if (back)
      {
        //y-=speed*sin(angle);
        //x-=speed*cos(angle);
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

    //collision detection
    for (int i = 0; i < myCars.size(); i++)
    {
      //check if this x and y are the same as detected x and y
      if (x != myCars.get(i).x && y != myCars.get(i).y)
      {
        if (dist(x, y, myCars.get(i).x, myCars.get(i).y) < 100)
        {
          collide = true;
        }
      }
      println("Car " + (i+1) + ": " + myCars.get(i).collide);
      
      if (collide)
      {
        x+=(x-myCars.get(i).x)/80;
        y+=(y-myCars.get(i).y)/80;
      }
    }

    //handle this car collision
  }

  void reset()
  {
    lives = 3;
    steerAngle = radians(270);
    x = startX;
    y = height/2;
  }

  void updateKeys(boolean fwd, boolean left, boolean back, boolean right)
  {
    this.fwd = fwd;
    this.left = left;
    this.back = back;
    this.right = right;
  }
}
