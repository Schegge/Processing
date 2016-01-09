class ChooseGrid {
  String nn = String.valueOf(N_DEFAULT);
  String bb = String.valueOf(B_DEFAULT);
  
  Txt num = new Txt(true, width/4, height/2 - grid.margin/2);
  Txt bom = new Txt(width*3/4, height/2 - grid.margin/2);
  
  ChooseGrid() {}
  
  void display() {
    pushStyle();
      noStroke();
      fill(BACK);
      rect(0, 0, width, height-grid.margin);
    popStyle();
      
    num.display(nn);
    bom.display(bb);
  }
  
  void whenKeyTyp() {
    if (num.focus) {
      nn = typing(nn);
    } else if (bom.focus) {
      bb = typing(bb);
    }
  }
  
  String typing(String t) {
    if (key == BACKSPACE && t.length() > 0) {
      t = t.substring(0, t.length()-1);
      
    } else if ( t.length() < 3 &&
              ( key >= '\u0030' && key <= '\u0039') ) {
      t += key;
    }
    return t;
    
  }
  
  void mousePress() {
    if (num.isUnderMouse()) {
      bom.focus = false;
      num.focus = true;
    } else if (bom.isUnderMouse()) {
      bom.focus = true;
      num.focus = false;
    }
  }
  
  class Txt {
    float x, y;
    boolean focus;
  
    Txt(boolean focus, float x, float y) {
      this.focus = focus;
      this.x = x;
      this.y = y;
    }
    
    Txt(float x, float y) {
      this.focus = false;
      this.x = x;
      this.y = y;
    }
    
    void display(String t) {
      pushStyle();
        noStroke();
        rectMode(CENTER);
        if (focus && round(millis()* 0.001) % 2 == 0) {
          fill(FLAG, 100);
          rect(x, y, txtSize*2, txtSize*2);
        }
        fill(TEXTS);
        text(String.valueOf(t), x, y);
      popStyle();
    }
    
    boolean isUnderMouse() {
      if ( abs(mouseX - x) < txtSize && abs(mouseY - y) < txtSize ) {
        return true;
      }
      return false;
    }
  }
}