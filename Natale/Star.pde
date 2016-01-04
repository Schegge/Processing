class Star {
  PVector pos;
  float scaling;
  float maxScale;
  float angle = 0;
 
  Star(PVector pos, float maxScale) {
    this.pos = new PVector(pos.x, pos.y);
    this.maxScale = maxScale*2.5;
  }
  
  void drawStar() {
    scaling = map(pos.y, 0, height, 0.1, maxScale);
    angle -= PI/52;
    pos.y--;
    
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(angle);
      scale(scaling);
        image(images.starPG, 0, 0);
    popMatrix(); 
  }
}
