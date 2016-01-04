class Shot {  
  float x = width/2;
  float y = height;
  float angle;
  float scaling;
  
  boolean out = false;
  boolean hitted = false;
  
  Shot(float mx, float my) {
    angle = atan2(my-y, mx-x);
  }
  
  void move() {    
    isHit();
    
    if (hitted || y < height/2 + 7 || x < 0 || x > width) {
      out = true;
    }
    
    x += cos(angle) * 4;
    y += sin(angle) * 4;
    
    scaling = sqrt(map(y, height/2, height, 0, 1));
    
    pushMatrix();
      translate(x, y);
      scale(scaling);
        image(images.shotPG, 0, 0);
    popMatrix();
  }
  
  void isHit() {
    for (Target t : target) {
      
      if (t.out) {      
        // se il bersaglio è visibile e viene colpito
        float d1 = abs(dist(x, y, t.pos.x, t.pos.y));
        if (d1 < 30*t.scaling && !hitted) {
          star.add(new Star(t.pos, t.scaling));
          hitted = true;
          t.hitted = true;
          info.hit++;
        }
      } else {
        // altrimenti se la palla colpisce uno degli alberi o il pupazzo
        float d2 = abs(dist(x, y, t.change[0].x, t.change[0].y));
        if (d2 < 70*t.scaling) {
          hitted = true;
        }
      }
      
    }
  }
  
}
