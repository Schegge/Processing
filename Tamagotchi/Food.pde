class Food {
  int x;
  int _x;
  int y = tama.h+n*3;
  int w;
  int h;
  
  PGraphics pg;
  
  int value;
  
  boolean grab = false;
  boolean eating = false;
  boolean eaten = false;
  
  float frameStart;
  
  Food(int x, int value, PGraphics pg) {
    this.x = x;
    _x = x;
    this.value = value;
    this.pg = pg;
    w = pg.width;
    h = pg.height;
  }
  
  void display() {
    if ( grab ) {
      frameStart = frameCount;
      grab = false;
      eating = true;
    } else if ( eating ) {
      x = tama.x - n*10;
      y = tama.y + n*5;
      if (frameCount - frameStart > 120 ) {
        eating = false;
        eaten = true;
      }
    } else if ( eaten ) {
      println("Hungry: " + game.hungry);
      x = _x;
      y = tama.h+n*3;
      game.hungry = game.hungry + value < 100 ? game.hungry + value : 100;
      eaten = false;
      println("Hungry: " + game.hungry);
    }
    image(pg, x, y);
  }
  
  boolean isUnderMouse() {
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      return true;
    }
    return false;
  }
}