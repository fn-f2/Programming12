//carter kwong programming 12 1-4

final int SCREEN1 = 1;
final int SCREEN2 = 2;
final int SCREEN3 = 3;
final int SCREEN4 = 4;

float b1X = 45;
float b1Y = 300;
float b2X = 555;
float b2Y = 300;

int mode;

void setup()
{
  size(600, 600);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  mode = SCREEN2;
}

void draw()
{
  switch (mode)
  {
  case SCREEN1:
    screen1();
    break;
  case SCREEN2:
    screen2();
    break;
  case SCREEN3:
    screen3();
    break;
  case SCREEN4:
    screen4();
    break;
  }
}
