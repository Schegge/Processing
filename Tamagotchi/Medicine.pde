class Medicine {  
  int x = tama.x + tama.w + n*2;
  int y = tama.y + n*5;
  
  PGraphics pg = images.syringe;
  int w = pg.width;
  int h = pg.height;
  
  boolean grab = true;
  boolean injecting = false;
  boolean end = false;
  
  float frameStart;
  
  Medicine() {}
  
  void display() {
    if ( grab ) {
      frameStart = frameCount;
      grab = false;
      injecting = true;
    } else if ( injecting ) {
      if (frameCount - frameStart > 120 ) {
        injecting = false;
        end = true;
      }
    } else if ( end ) {
      println("Health: " + game.health);
      game.health = 100;
      println("Health: " + game.health);
      end = false;
      game.scene = -1;
    }
    image(pg, x, y);
  }
}