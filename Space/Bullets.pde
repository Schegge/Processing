class Bullets {  
  float x = alien.x;
  float y = alien.y;  
  
  float w = imgBuls.width;
  float h = imgBuls.height;
  
  boolean out = false;
  
  float cosen, sen;
  
  Bullets(float mx, float my) {
    float angle = atan2(my - y, mx - x);
    cosen = cos(angle);
    sen = sin(angle);
    level.bulsUsed++;
  }
    
  void update() {
      move();
      drawing();    
  }
  
  void move() {
      x += 4 * cosen;
      y += 4 * sen;
    
      if ( x - w/2 > width || x + w/2 < 0 || y - h/2 > height || y + h/2 < 0 ) {
        out = true;
      }
  }
  
  void drawing() {
    pushMatrix();
      translate(x, y);
      image(imgBuls, 0, 0);
    popMatrix(); 
  }
  
}
