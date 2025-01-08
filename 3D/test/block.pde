class block
{
  float x, y, z;
  PImage top, bottom, front, back, left, right;

  block(int type, float x, float y, float z)
  {
    this.x = x;
    this.y = y;
    this.z = z;

    switch (type)
    {
      case grass:
        top = grasstop;
        bottom = grassbottom;
        front = grassside;
        back = grassside;
        left = grassside;
        right = grassside;
        break;
      case oaklog:
        top = oaktop;
        bottom = oaktop;
        front = oakside;
        back = oakside;
        left = oakside;
        right = oakside;
        break;
      case stonebricks:
        top = stonebricktexture;
        bottom = stonebricktexture;
        front = stonebricktexture;
        back = stonebricktexture;
        left = stonebricktexture;
        right = stonebricktexture;
        break;
      case diamond:
        top = diamondtexture;
        bottom = diamondtexture;
        front = diamondtexture;
        back = diamondtexture;
        left = diamondtexture;
        right = diamondtexture;
        break;
    }
  }

  void show()
  {
    pushMatrix();
    translate(x, y, z);

    noStroke();
    beginShape(QUADS);

    //top
    //x, y, x, tx, ty
    texture(top);
    vertex(0, 0, 0, 0, 0);
    vertex(1, 0, 0, 1, 0);
    vertex(1, 0, 1, 1, 1);
    vertex(0, 0, 1, 0, 1);

    endShape();
    beginShape(QUADS);

    //bottom
    texture(bottom);
    vertex(0, 1, 1, 0, 0);
    vertex(1, 1, 1, 1, 0);
    vertex(1, 1, 0, 1, 1);
    vertex(0, 1, 0, 0, 1);

    endShape();
    beginShape(QUADS);

    //front
    texture(front);
    vertex(0, 0, 1, 0, 0);
    vertex(1, 0, 1, 1, 0);
    vertex(1, 1, 1, 1, 1);
    vertex(0, 1, 1, 0, 1);

    endShape();
    beginShape(QUADS);

    //back
    texture(back);
    vertex(1, 0, 0, 0, 0);
    vertex(0, 0, 0, 1, 0);
    vertex(0, 1, 0, 1, 1);
    vertex(1, 1, 0, 0, 1);

    endShape();
    beginShape(QUADS);

    //left
    texture(left);
    vertex(0, 0, 0, 0, 0);
    vertex(0, 0, 1, 1, 0);
    vertex(0, 1, 1, 1, 1);
    vertex(0, 1, 0, 0, 1);

    endShape();
    beginShape(QUADS);

    //right
    texture(right);
    vertex(1, 0, 1, 0, 0);
    vertex(1, 0, 0, 1, 0);
    vertex(1, 1, 0, 1, 1);
    vertex(1, 1, 1, 0, 1);

    endShape();
    popMatrix();
  }
}
