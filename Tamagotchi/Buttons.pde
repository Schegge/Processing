class ButtonPG {
  int x;
  int y = n*6;
  
  PGraphics pg;
  int w;
  int h;
  
  int m = width/6;
  
  ButtonPG(int id, PGraphics pg) {
    this.pg = pg;
    w = pg.width;
    h = pg.height;
    x = m*id + w/2;
  }
  
  void display(int lvl) {
    pushMatrix();
    translate(x, y);
      image(pg, 0, 0);
      
      pushMatrix();
      translate(n*2, -n*4);
        if(lvl < 10) image(images.empty, 0, 0);
        else if(lvl < 60) image(images.low, 0, 0);
        else if(lvl < 90) image(images.medium, 0, 0);
        else image(images.high, 0, 0);
      popMatrix();
    popMatrix();
  }
  
  void display() {
    image(pg, x, y);
  }
  
  boolean isUnderMouse() {
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      return true;
    }
    return false;
  }
}


class ButtonTXT {
  int x;
  int y;
  
  int w;
  int h;
  
  String str;
  
  PGraphics pg;
  
  ButtonTXT(int x, int y, String str) {
    this.x = x;
    this.y = y;
    this.str = str;
    
    h = txtSize/2;
    w = str.length()*txtSize/2;
  }
  
  void display() {
    pushStyle();
    fill(BLACK);
    text(str, x, y);
    popStyle();
  }
  
  boolean isUnderMouse() {
    if(abs(mouseX - x) < w && abs(mouseY - y) < h) {
      return true;
    }
    return false;
  }
}