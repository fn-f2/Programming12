class Button
{
  boolean clicked;
  float x, y, w, h;
  color norm, high;
  String text;

  Button(String t, float _x, float _y, float _w, float _h, color _norm, color _high)
  {
    text = t;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    norm = _norm;
    high = _high;
    
    clicked = false;
  }

  void show()
  { 
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    if (checkMouseWithin(x, y, w, h)) fill(high);
    else fill(norm);
    rect(x, y, w, h);
    if (checkMouseWithin(x, y, w, h)) fill(norm);
    else fill(high);
    textSize(w/6);
    text(text, x, y);
    
    if (checkMouseWithin(x, y, w, h) && mouseReleased) clicked = true;
    else clicked = false;
  }

  boolean checkMouseWithin(float _x, float _y, float _w, float _h)
  {
    if (mouseX > _x-_w/2 && mouseX < _x+_w/2 && mouseY > _y-_h/2 && mouseY < _y+_h/2) return true;
    else return false;
  }
}
