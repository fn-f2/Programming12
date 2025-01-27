
boolean canMoveBackward()
{
  float fwdx, fwdz, lx, lz, rx, rz;
  int mapx, mapy, maplx, maply, maprx, mapry;
  fwdx = eyeX + 150*cos(LRHeadAngle);
  lx = eyeX + 150*cos(LRHeadAngle+radians(20)+radians(180));
  rx = eyeX + 150*cos(LRHeadAngle-radians(20)+radians(180));
  fwdz = eyeZ + 150*sin(LRHeadAngle);
  lz = eyeZ + 150*sin(LRHeadAngle+radians(20)+radians(180));
  rz = eyeZ + 150*sin(LRHeadAngle-radians(20)+radians(180));
  mapx = int(fwdx+2000-gridSize)/gridSize;
  mapy = int(fwdz+2000-gridSize)/gridSize;
  maplx = int(lx+2000-gridSize)/gridSize;
  maply = int(lz+2000-gridSize)/gridSize;
  maprx = int(rx+2000-gridSize)/gridSize;
  mapry = int(rz+2000-gridSize)/gridSize;
  
  if (map.get(mapx, mapy) == white && map.get(maplx, maply) == white && map.get(maprx, mapry) == white) return true;
  else return false;
}

boolean canMoveLeft()
{
  float fwdx, fwdz, lx, lz, rx, rz;
  int mapx, mapy, maplx, maply, maprx, mapry;
  fwdx = eyeX + 150*cos(LRHeadAngle);
  lx = eyeX + 150*cos(LRHeadAngle+radians(20)+radians(270));
  rx = eyeX + 150*cos(LRHeadAngle-radians(20)+radians(270));
  fwdz = eyeZ + 150*sin(LRHeadAngle);
  lz = eyeZ + 150*sin(LRHeadAngle+radians(20)+radians(270));
  rz = eyeZ + 150*sin(LRHeadAngle-radians(20)+radians(270));
  mapx = int(fwdx+2000-gridSize)/gridSize;
  mapy = int(fwdz+2000-gridSize)/gridSize;
  maplx = int(lx+2000-gridSize)/gridSize;
  maply = int(lz+2000-gridSize)/gridSize;
  maprx = int(rx+2000-gridSize)/gridSize;
  mapry = int(rz+2000-gridSize)/gridSize;
  
  if (map.get(mapx, mapy) == white && map.get(maplx, maply) == white && map.get(maprx, mapry) == white) return true;
  else return false;
}

boolean canMoveRight()
{
  float fwdx, fwdz, lx, lz, rx, rz;
  int mapx, mapy, maplx, maply, maprx, mapry;
  fwdx = eyeX + 150*cos(LRHeadAngle);
  lx = eyeX + 150*cos(LRHeadAngle+radians(20)+radians(90));
  rx = eyeX + 150*cos(LRHeadAngle-radians(20)+radians(90));
  fwdz = eyeZ + 150*sin(LRHeadAngle);
  lz = eyeZ + 150*sin(LRHeadAngle+radians(20)+radians(90));
  rz = eyeZ + 150*sin(LRHeadAngle-radians(20)+radians(90));
  mapx = int(fwdx+2000-gridSize)/gridSize;
  mapy = int(fwdz+2000-gridSize)/gridSize;
  maplx = int(lx+2000-gridSize)/gridSize;
  maply = int(lz+2000-gridSize)/gridSize;
  maprx = int(rx+2000-gridSize)/gridSize;
  mapry = int(rz+2000-gridSize)/gridSize;
  
  if (map.get(mapx, mapy) == white && map.get(maplx, maply) == white && map.get(maprx, mapry) == white) return true;
  else return false;
}
