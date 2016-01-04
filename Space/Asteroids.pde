class Asteroids {  
  float w = imgAsts.width;
  float h = imgAsts.height;
    
  float x = round(random(100, width-100));
  float y = -h/2;
  
  float rCrash = random(0.6, 0.8);
  
  boolean destroyed = false;
  boolean crashed = false;
  
  int id;
  
  Asteroids(int id) {
    this.id = id;
  }
  
  void update() {    
    if ( !crashed && !destroyed ) {
      if ( y > height*rCrash ) {
        crashed = true;
        level.astsCrashed++;
      }
      
      if ( (frameCount - frameStart) % 2 == 0 ) {
        y += 1 + round(id/2);
      }
    }
    
    hit();
    
    drawing();
  }
  
  void hit() {
    for (Bullets b : buls) {
      if ( !destroyed && !crashed && !b.out ) {
        float d = dist(x, y, b.x, b.y);
        
        if ( d < (b.w/2 + w/2 - 4) ) {
          destroyed = true;
          level.astsDestroyed++;
          b.out = true;
        }
      }
      
    }
  }
  
  void drawing() {
    pushMatrix();
      translate(x, y);
      
      if ( crashed ) {
        image(imgAstsCrash, 0, 0);
        
      } else if ( destroyed ) {
        image(imgAstsDestr, 0, 0);
        
      } else {
        image(imgAsts, 0, 0);
      }
      
    popMatrix();  
  }

}
