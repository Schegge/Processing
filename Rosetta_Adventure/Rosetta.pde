class Rosetta {
  PVector position;
  PVector center;
  PVector velocity;
  PVector acceleration;
  boolean doScaling;
  float scaling;
  
  PVector[] ps = {
    new PVector(ww * 1.2 ,          0),
    new PVector(ww/2 - 15, hh/2 -  10),
    new PVector(ww/2 + 25, hh/2 -  80),
    new PVector(ww/2 - 15, hh/2 - 100),
  };

  Rosetta() {
    position = ps[0];
    center = ps[1];
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    doScaling = true;
    scaling = 0;
  }

  void move() {
    PVector dir = PVector.sub(center, position);
    dir.normalize();
    dir.mult(0.06);
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(1);
    position.add(velocity);
    acceleration.mult(0);
  }  

  //scaling animation in the beginning
  void toScale() {
    scale(scaling);
    scaling += 0.0028;
    if (scaling >= 1) {
      scaling = 1;
      doScaling = false;
    }
  }

  void drawing() {
    pushStyle();
    rectMode(CORNER);
    pushMatrix();    
    translate(position.x, position.y);
    if (doScaling) { 
      toScale();
    }

    //solar wings [1]
    strokeWeight(2);
    stroke(55, 105, 125);
    line(-25, 16, -35, 10);
    line(-26, 25, -35, 33);
    fill(102, 180, 201);
    quad(-31, 3, -132, 24, -131, 42, -31, 37);
    fill(110, 190, 213);
    quad(41, -6, 183, -25, 193, 18, 47, 34);
    //face?
    fill(196, 229, 238);
    quad(-25, 0, 25, -10, 30, 40, -25, 40);
    fill(116, 147, 163);
    quad(25, -10, 35, -5, 38, 35, 30, 40);
    //smile
    ellipse(-12, 10, 3, 7);
    ellipse(4, 7, 3, 7);
    noFill();
    pushMatrix();
    rotate(radians(-5));
    arc(-4, 18, 35, 18, radians(-20), radians(180));
    popMatrix();
    //solar wings [2]
    line(41, 3, 33, 10);
    line(44, 23, 33, 20);
    //solar wings [3]
    line(-118, 25, -117, 38);
    line(-92, 19, -91, 36);
    line(-60, 13, -59, 35);
    line(73, -7, 79, 26);
    line(108, -10, 115, 21);
    line(147, -15, 154, 17);
    //antenna
    line(14, -9, 9, -42);
    line(6, -7, 9, -42);
    fill(81, 129, 148);
    ellipse(8, -47, 11, 22);
    fill(196, 229, 238);
    ellipse(5, -47, 11, 24);
    strokeWeight(4);
    line(-7, -47, 4, -47);

    popMatrix();
    popStyle();
  }
}