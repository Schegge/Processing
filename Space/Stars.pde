class Stars {  
  float x = round(random(width));
  float y = round(random(height));  
  
  float w = imgStars.width;
  float h = imgStars.height;
  
  void update() {
    
    if ( (frameCount - frameStart) % 2 == 0 ) {
      x++;
      y += random(-0.4, 0.4);
    }
    
    if ( x - w/2 > width ) {
      x = -w/2;
      y = round(random(height));
    }
    
    drawing();
  }
  
  void drawing() {
    pushMatrix();
      translate(x, y);
      image(imgStars, 0, 0);
    popMatrix();  
  }
  
}