/*Carter Kwong Programming 12 1-4
 2025/01/06*/

PImage diamondtexture, grasstop, grassbottom, grassside, oaktop, oakside, stonebricktexture;
float rotx, roty;
int checkp;

final int grass = 1;
final int oaklog = 2;
final int stonebricks = 3;
final int diamond = 4;

ArrayList<block> myBlocks;

void setup()
{
  size(800, 800, P3D);
  
  diamondtexture = loadImage("Diamond.png");
  grasstop = loadImage("Grass_Block_Top_C.png");
  grassside = loadImage("Grass_Block_Side.png");
  grassbottom = loadImage("Dirt_(texture)_JE2_BE2.png");
  oaktop = loadImage("Oak_Log_Top.png");
  oakside = loadImage("Oak_Log_Side.png");
  stonebricktexture = loadImage("Stone_Bricks.png");

  textureMode(NORMAL);

  perspective();

  myBlocks = new ArrayList();

  //grass
  for (int x = -5; x < 5; x++)
  {
    for (int z = -5; z < 5; z++)
    {
      block gb = new block(grass, x, 0, z);
      myBlocks.add(gb);
    }
  }

  //logs
  for (int y = -1; y > -4; y--)
  {
    block lb = new block(oaklog, 0, y, 1);
    myBlocks.add(lb);
  }
  
  block dm = new block(diamond, -1, -1, -3);
  myBlocks.add(dm);
  
  checkp = 2;
}

void draw()
{
  background(#ffffff);
  if (checkp == 1)
  {
    ball(width/2+200, height/2-150, 0, #000000, #0bb1b7, 130);
    ball(width/2-180, height/2+300, -300, #404040, #000000, 170);
    ball(width/2-350, height/2-270, 0, #ffffff, #000000, 300);
    cube(width/2, height/2, 0, #FF0000, #000000, 150);
    cube(width/2+130, height/2+100, 200, #0000FF, #000000, 150);
  } else
  {
    background(#ffffff);

    pushMatrix();
    translate(width/2, height/2, 0);
    scale(50);
    rotateX(rotx);
    rotateY(roty);

    //diamond(0, 0, 0);
    //grass(-1, 0, 0);

    for (int i = 0; i < myBlocks.size(); i++)
    {
      myBlocks.get(i).show();
    }
    popMatrix();
  }
}

void ball(float x, float y, float z, color c1, color c2, float size)
{
  pushMatrix();
  translate(x, y, z);
  rotateX(rotx);
  rotateY(roty);
  fill(c1);
  stroke(c2);
  strokeWeight(2);
  sphere(size);
  popMatrix();
}

void cube(float x, float y, float z, color c1, color c2, float size)
{
  pushMatrix();
  translate(x, y, z);
  rotateX(rotx);
  rotateY(roty);
  fill(c1);
  stroke(c2);
  strokeWeight(2);
  box(size);
  popMatrix();
}

void diamond(float x, float y, float z)
{
  pushMatrix();
  translate(x, y, z);

  noStroke();
  beginShape(QUADS);

  //top
  //x, y, x, tx, ty
  texture(diamondtexture);
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  //bottom
  vertex(0, 1, 1, 0, 0);
  vertex(1, 1, 1, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //back
  vertex(1, 0, 0, 0, 0);
  vertex(0, 0, 0, 1, 0);
  vertex(0, 1, 0, 1, 1);
  vertex(1, 1, 0, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //right
  vertex(1, 0, 1, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(1, 1, 1, 0, 1);

  endShape();
  popMatrix();
}

void grass(float x, float y, float z)
{
  pushMatrix();
  translate(x, y, z);

  noStroke();
  beginShape(QUADS);

  //top
  //x, y, x, tx, ty
  texture(grasstop);
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  endShape();
  beginShape(QUADS);

  //bottom
  texture(grassbottom);
  vertex(0, 1, 1, 0, 0);
  vertex(1, 1, 1, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  endShape();
  beginShape(QUADS);

  texture(grassside);
  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //back
  vertex(1, 0, 0, 0, 0);
  vertex(0, 0, 0, 1, 0);
  vertex(0, 1, 0, 1, 1);
  vertex(1, 1, 0, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //right
  vertex(1, 0, 1, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(1, 1, 1, 0, 1);

  endShape();
  popMatrix();
}

//void block(PImage top, PImage bottom, PImage front, PImage back, PImage left,
//  PImage right, float x, float y, float z)
//{
//pushMatrix();
//translate(x, y, z);

//noStroke();
//beginShape(QUADS);

////top
////x, y, x, tx, ty
//texture(top);
//vertex(0, 0, 0, 0, 0);
//vertex(1, 0, 0, 1, 0);
//vertex(1, 0, 1, 1, 1);
//vertex(0, 0, 1, 0, 1);

//endShape();
//beginShape(QUADS);

////bottom
//texture(bottom);
//vertex(0, 1, 1, 0, 0);
//vertex(1, 1, 1, 1, 0);
//vertex(1, 1, 0, 1, 1);
//vertex(0, 1, 0, 0, 1);

//endShape();
//beginShape(QUADS);

////front
//texture(front);
//vertex(0, 0, 1, 0, 0);
//vertex(1, 0, 1, 1, 0);
//vertex(1, 1, 1, 1, 1);
//vertex(0, 1, 1, 0, 1);

//endShape();
//beginShape(QUADS);

////back
//texture(back);
//vertex(1, 0, 0, 0, 0);
//vertex(0, 0, 0, 1, 0);
//vertex(0, 1, 0, 1, 1);
//vertex(1, 1, 0, 0, 1);

//endShape();
//beginShape(QUADS);

////left
//texture(left);
//vertex(0, 0, 0, 0, 0);
//vertex(0, 0, 1, 1, 0);
//vertex(0, 1, 1, 1, 1);
//vertex(0, 1, 0, 0, 1);

//endShape();
//beginShape(QUADS);

////right
//texture(right);
//vertex(1, 0, 1, 0, 0);
//vertex(1, 0, 0, 1, 0);
//vertex(1, 1, 0, 1, 1);
//vertex(1, 1, 1, 0, 1);

//endShape();
//popMatrix();
//}

void mouseDragged()
{
  rotx += (pmouseY-mouseY)*0.01;
  roty += (pmouseX-mouseX)*-0.01;
}
