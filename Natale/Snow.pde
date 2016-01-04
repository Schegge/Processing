class Snow {
  float x = random(width);
  float y = random(height);
  float scaling = random(0.5, 1);
  float alpha = 255;
  float angle;
  float speed;
  
  Snow() {
    speed = random(0.3, 1);
    angle = random(-QUARTER_PI, QUARTER_PI);
  }
  
  void drawSnow() {
    move();
    
    pushMatrix();
      translate(x, y);
      scale(scaling);
      rotate(angle);
      pushStyle();
      tint(255, alpha);
        image(images.snowPG, 0, 0);
      popStyle();
    popMatrix();
  }
  
  void move() {    
    x += random(-0.8, 0.8);
    y += speed;
    
    alpha = map(y, 0, height, 255, 50);
    
    angle += random(PI/100);
    
    if (y > height) {
      x = random(width);
      scaling = random(0.5, 1);
      y = -scaling*10;
      speed = random(0.3, 1);
    }
  }
}