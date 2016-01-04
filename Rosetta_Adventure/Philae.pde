class Philae {
  float x;
  float y;
  float xDestination;
  float yDestination;
  float scaling;
  float hanging;
  float hangingRate;
  boolean movingToComet;
  float rotation;
  boolean sleeping;
  float eyesClosing;

  Philae() {
    x = 0;
    y = 0;
    xDestination = 0;
    yDestination = 0;
    scaling = 0;
    hanging = 0;
    hangingRate = 0.2;
    movingToComet = false;
    rotation = 0;
    sleeping = false;
    eyesClosing = 0;
  }

  void toScale() {
    scale(scaling);
    if (movingToComet) {//scaling animation when landing
      scaling -= 0.0015;
      if (scaling <= 0.65) { 
        scaling = 0.65;
      }
    } else {//scaling animation in the beginning
      scaling += 0.02;
      if (scaling >= 1) { 
        scaling = 1;
      }
    }
  }

  //drawing of philae when he is attached to rosetta
  void drawingR() {
    pushStyle();
    rectMode(CORNER);
    pushMatrix();
    translate(x, y);
    toScale();
    strokeWeight(2);
    stroke(55, 105, 125);

    //left hand
    line(-8 + hanging, 8, -10, -14);
    //face?
    fill(196, 229, 238);
    quad(-13 + hanging, -4, 18 + hanging, -4, 21 + hanging, 30, -14 + hanging, 30);
    fill(116, 147, 163);
    quad(18 + hanging, -4, 26 + hanging, -1, 29 + hanging, 24, 21 + hanging, 30);
    //smile
    ellipse(-5 + hanging, 8, 1, 5);
    ellipse(5 + hanging, 7, 1, 5);
    noFill();
    pushMatrix();
    rotate(radians(-5));
    arc(1 + hanging, 18, 22, 7, radians(34), radians(214));
    popMatrix();
    //legs
    line(-2 + hanging, 30, -2 - hanging, 43 - hanging/2);
    line(13 + hanging, 30, 13 - hanging, 44 - hanging/2);
    fill(110, 190, 213);
    ellipse(-5 - hanging, 43 - hanging/2, 10, 7);
    ellipse(10 - hanging, 44 - hanging/2, 10, 7);
    //right hand
    line(23 + hanging, 8, 21, -14); 
    popMatrix();
    popStyle();

    // swaying
    hanging += hangingRate;
    if (hanging >= 3) {
      hangingRate = -hangingRate;
    }
    if (hanging <= -3) {
      hangingRate = -hangingRate;
    }
  } // fine drawR

  //drawing of philae when moving and is attached to the comet
  void drawingC() {
    pushStyle();
    rectMode(CORNER);
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    toScale();
    strokeWeight(2);
    stroke(55, 105, 125);

    //face?
    fill(196, 229, 238);
    quad(-13, -4, 18, -4, 21, 30, -14, 30);
    fill(116, 147, 163);
    quad(18, -4, 26, -1, 29, 24, 21, 30);
    //smile
    if (sleeping) {//eyes closing animation to put philae to sleep
      eyesClosing += 0.05;
      if (eyesClosing >= 4) { 
        eyesClosing = 4;
      }
    }
    ellipse(-5, 8, 1 + eyesClosing, 5 - eyesClosing);
    ellipse(5, 7, 1 + eyesClosing, 5 - eyesClosing);    
    noFill();
    pushMatrix();
    rotate(radians(-5));
    arc(1, 18, 22, 7, radians(34), radians(214));
    popMatrix();
    //legs
    line(-2, 30, -2, 35);
    line(13, 30, 13, 36);
    fill(110, 190, 213);
    ellipse(-5, 38, 10, 7);
    ellipse(10, 39, 10, 7);
    //right hand
    line(23, 9, 18, 23);

    popMatrix();
    popStyle();
  } // fine drawC

  void move() {
    if (x > xDestination) {
      x /= 1.0022;
      if (x < xDestination) { 
        x = xDestination;
      }
    } else {
      x *= 1.0022;
      if (x > xDestination) { 
        x = xDestination;
      }
    }
    if (y < yDestination) {
      y *= 1.0015;
      if (y > yDestination) { 
        y = yDestination;
      }
    } else {
      y /= 1.0015;
      if (y < yDestination) { 
        y = yDestination;
      }
    }
  } // fine move
}