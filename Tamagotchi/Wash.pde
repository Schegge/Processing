class Wash {
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  
  PGraphics pg = images.sponge;
  int w = pg.width/2;
  int h = pg.height/2;
  
  Wash() {}
  
  void display() {
    if ( tama.isUnderMouse() ) {
      while ( bubbles.size() < 4 ) {
        bubbles.add(new Bubble());
      }
      for(Bubble b : bubbles) b.display();
    } else {
      bubbles.clear();
    }
    image(pg, mouseX-w, mouseY-h);    
  }
  
  
  class Bubble {
    float x;
    float y;
    
    int w = images.bubble.width/2;
    int h = images.bubble.height/2;
    
    Bubble() {}
    
    void display() {
      if ( frameCount % 10 == 0 ) {
        x = cos(frameCount/10)*random(-30, 30);
        y = sin(frameCount/10)*random(-30, 30);
      }
      
      pushMatrix();
      translate(mouseX + x - w, mouseY + y - h);
        image(images.bubble, 0, 0);
      popMatrix();
    }
  }
  
}