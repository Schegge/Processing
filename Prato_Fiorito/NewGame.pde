class NewGame {    
  float x, y;    
  float w, h;
  
  NewGame() {
    x = grid.ww/2;
    y = grid.hh-grid.margin/2;
    
    w = grid.margin*1.5;
    h = grid.margin*0.4;
  }
  
  void display() {
    pushStyle();
      noStroke();
      rectMode(CENTER);
      fill(255, 150);
      rect(x, y, w, h);
      fill(TEXTS);
      text("New Game", x, y);
    popStyle();
  }
  
  void clicked() {
    if (mousePressed && isUnderMouse()) {
      if (scene == 0) {
        N_DEFAULT = Integer.parseInt(chooseG.nn);
        B_DEFAULT = Integer.parseInt(chooseG.bb);
        if (N_DEFAULT > 25) N_DEFAULT = 25;
        if (B_DEFAULT > N_DEFAULT*N_DEFAULT/3) B_DEFAULT = N_DEFAULT*N_DEFAULT/3;
        grid.init(N_DEFAULT, B_DEFAULT);
        surface.setSize(grid.ww, grid.hh);
        scene = 1;
        x = grid.ww/2;
        y = grid.hh-grid.margin/2;
      } else {
        chooseG = new ChooseGrid();
        scene = 0;
      }
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

