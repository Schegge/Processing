class Alien {  
  float x = width*0.5;
  float y = height*0.7;
  
  int n = 0;
  int inc = 1;
  int max = 15;
  
  void update() {    
    if ( (frameCount - frameStart) % 4 == 0 ) {
      y += inc;
      n++;
      if ( n > max || n < -max ) {
        inc = -inc;
        n = 0;
      }
    }
    
    drawing();
  }
  
  void drawing() {     
    pushMatrix();
      translate(x, y);
      image(imgAlien, 0, 0);
    popMatrix();  
  } 
 
}