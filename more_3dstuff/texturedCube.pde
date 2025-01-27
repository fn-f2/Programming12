void texturedCube(float x, float y, float z, PImage texture, float size)
{
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size);

  world.noStroke();
  world.beginShape(QUADS);

  //top
  //x, y, x, tx, ty
  world.texture(texture);
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 120, 0);
  world.vertex(1, 0, 1, 120, 120);
  world.vertex(0, 0, 1, 0, 120);

  //bottom
  world.vertex(0, 1, 1, 0, 0);
  world.vertex(1, 1, 1, 120, 0);
  world.vertex(1, 1, 0, 120, 120);
  world.vertex(0, 1, 0, 0, 120);

  //front
  world.vertex(0, 0, 1, 0, 0);
  world.vertex(1, 0, 1, 120, 0);
  world.vertex(1, 1, 1, 120, 120);
  world.vertex(0, 1, 1, 0, 120);

  //back
  world.vertex(1, 0, 0, 0, 0);
  world.vertex(0, 0, 0, 120, 0);
  world.vertex(0, 1, 0, 120, 120);
  world.vertex(1, 1, 0, 0, 120);

  //left
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(0, 0, 1, 120, 0);
  world.vertex(0, 1, 1, 120, 120);
  world.vertex(0, 1, 0, 0, 120);

  //right
  world.vertex(1, 0, 1, 0, 0);
  world.vertex(1, 0, 0, 120, 0);
  world.vertex(1, 1, 0, 120, 120);
  world.vertex(1, 1, 1, 0, 120);

  world.endShape();
  world.popMatrix();
}

void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size)
{
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size);

  world.noStroke();
  world.beginShape(QUADS);

  //top
  //x, y, x, tx, ty
  world.texture(top);
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 120, 0);
  world.vertex(1, 0, 1, 120, 120);
  world.vertex(0, 0, 1, 0, 120);

  world.endShape();
  world.beginShape(QUADS);

  //bottom
  world.texture(bottom);
  world.vertex(0, 1, 1, 0, 0);
  world.vertex(1, 1, 1, 120, 0);
  world.vertex(1, 1, 0, 120, 120);
  world.vertex(0, 1, 0, 0, 120);

  world.endShape();
  world.beginShape(QUADS);

  world.texture(side);
  //front
  world.vertex(0, 0, 1, 0, 0);
  world.vertex(1, 0, 1, 120, 0);
  world.vertex(1, 1, 1, 120, 120);
  world.vertex(0, 1, 1, 0, 120);

  //back
  world.vertex(1, 0, 0, 0, 0);
  world.vertex(0, 0, 0, 120, 0);
  world.vertex(0, 1, 0, 120, 120);
  world.vertex(1, 1, 0, 0, 120);

  //left
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(0, 0, 1, 120, 0);
  world.vertex(0, 1, 1, 120, 120);
  world.vertex(0, 1, 0, 0, 120);

  //right
  world.vertex(1, 0, 1, 0, 0);
  world.vertex(1, 0, 0, 120, 0);
  world.vertex(1, 1, 0, 120, 120);
  world.vertex(1, 1, 1, 0, 120);

  world.endShape();
  world.popMatrix();
}
