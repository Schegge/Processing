class Heart {
  
  float x, xInit;
  float y, yInit;
  
  Heart(float _x, float _y) {
    x = xInit = _x;
    y = yInit = _y;
  }
  
  float w = random(10, 15);;
  float h = w*0.7;
  
  float velocity = 0;
  float jump = random(20, 40);  
  float direction = random(0, 1);
  
  float[][] points = {
    {  0   , -0.7  },
    { -0.25, -0.9  },
    { -0.5 , -1    },
    { -0.95, -0.8  },
    { -1   ,  0    },
    { -0.5 ,  0.7  },
    {  0   ,  1    }
  };
    
  void allMethods() {
    drawing();
    update();
    checkBorders();
  }
    
  void update() {
    if ( direction < 0.6 ) x--; else x++;
    y += pow(velocity, 2) + velocity*jump - 3;
    velocity += 0.0008;
  }
  
  void checkBorders() {
    if ( x - w > width || x + w < 0 || y + h < 0 || y - h > height ) {
      x = xInit;
      y = yInit;
      velocity = 0;
      jump = random(20, 40);
      direction = random(0, 1);
    }
  }
  
  void drawing() {
    pushMatrix();
    translate(x, y);
    
    fill(#ED2D67);
    beginShape();
      for ( int i = 0; i < points.length; i++ ) {
        vertex(w*points[i][0], h*points[i][1]);
      }
      for ( int i = points.length-1; i >= 0 ; i-- ) {
        vertex(-w*points[i][0], h*points[i][1]);
      }
    endShape();
    
    popMatrix();    
  }
  
}