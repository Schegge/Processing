class Earth {  
  float x = width*0.5;
  float y = height*0.7;
  
  float w = imgEarth.width;
  float h = imgEarth.height;
  
  void drawing() {
    pushMatrix();
      translate(x, y);
      fill(#76B0B7);
      ellipse(0, 0, w-10, h+3);
      image(imgEarth, 0, 0);  
    popMatrix();
  }
  
}