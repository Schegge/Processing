class NewGame {
  
  float x = width/2;
  float y = height-grid.margin/2;
  
  float w = grid.margin*1.5;
  float h = grid.margin*0.4;
  
  /*
   * @TODO: change grid's size and n' of bombs
   */
  // int _n = 9;
  // int _b = 10;
  
  NewGame() {}
  
  void display() {
    pushStyle();
      noStroke();
      rectMode(CENTER);
      fill(255, 150);
      rect(x, y, w, h);
      fill(TEXTS);
      text("New Game", x, y);
    popStyle();
    
    clicked();
  }
  
  void clicked() {
    if (mousePressed && isUnderMouse()) {
      grid = new Grid(N_DEFAULT, B_DEFAULT);
      int s = grid.n*grid.size + grid.margin*2;
      surface.setSize(s, s+grid.margin/2);
    }
  }
 
  boolean isUnderMouse() {
    if ( abs(mouseX - x) < w/2 &&
         abs(mouseY - y) < h/2 ) {
      return true;
    }
    return false;      
  }
  
}