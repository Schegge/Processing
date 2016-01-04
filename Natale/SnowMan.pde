class SnowMan {
  PVector pos;
  float scaling;
  
  PGraphics pg = images.snowManPG; 
  
  SnowMan(PVector pos) {
    this.pos = pos;
    scaling = map(pos.y, height/3, height, 0, 1);
  }
  
  void drawSnowMan() {    
    pushMatrix();
      translate(pos.x, pos.y);
      scale(scaling);
        image(pg, 0, 0);
    popMatrix();
  }  
}