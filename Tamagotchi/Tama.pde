class Tama {
  int x;
  int y;
  
  PGraphics pgTesta;
  PGraphics pgCorpo;  
  PGraphics pgOf;
  PGraphics pgOt;
  PGraphics pgOn;
  PGraphics pgOs;
  PGraphics pgOd;
  
  int w;
  int h;
  
  boolean sad = false;
  boolean happy = false;
  
  int mov = 0;
  
  Tama() {
    pgTesta = images.tamaTesta;
    pgCorpo = images.tamaCorpo;
    pgOf = images.tamaOcchiFeli;
    pgOt = images.tamaOcchiTris;
    pgOn = images.tamaOcchiNorm;
    pgOs = images.tamaOcchiSleep;
    pgOd = images.tamaOcchiDeath;
    w = pgTesta.width;
    h = pgTesta.height + pgCorpo.height;
    x = (width-w)/2;
    y = h*5;
  }
  
  void display() {
    if ( keyPressed && key == CODED ) {
      if ( keyCode == RIGHT ) {
        x += x + w < width ? n : 0;
      } else if ( keyCode == LEFT ) {
        x -= x > 0 ? n : 0;
      }
    }
    
    if ( game.night || game.death ) {
      mov = n;
      
    } else {
      if (frameCount % 40 == 0) {
        mov = mov == 0 ? n : 0;
      }
      if ( game.playing || isUnderMouse() ) {
        happy = true;
        sad = false;
      } else if ( game.hungry < 10 || game.sleep < 10 || game.health < 10 || game.clean < 10 || game.happy < 10 ) {
        happy = false;
        sad = true;
      } else {
        happy = false;
        sad = false;
      }
    }
    
    if (game.poop) {
      image(images.poop, x - images.poop.width, y + h - images.poop.height);
    }    
    pushMatrix();
      translate(x, y);
        image(pgCorpo, 0, n*12);
        pushMatrix();
          translate(0, mov);
            image(pgTesta, 0, 0);
                 if (game.death) image(pgOd, 0, n*4);
            else if (game.night) image(pgOs, 0, n*5);
            else if (happy)      image(pgOf, 0, n*5);
            else if (sad)        image(pgOt, 0, n*5);
            else                 image(pgOn, 0, n*5);
        popMatrix();
    popMatrix();
  }
  
  boolean isUnderMouse() {
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      return true;
    }
    return false;
  }

}