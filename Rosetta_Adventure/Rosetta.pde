class Rosetta {
  PVector position;
  PVector center;
  PVector velocity;
  PVector acceleration;
  boolean doScaling;
  boolean end;
  float scaling;
  
  PVector[] ps = {
    new PVector(ww       ,          0),
    new PVector(ww/2 - 15, hh/2 -  30),
    new PVector(ww/2 + 35, hh/2 -  80),
    new PVector(ww/2 - 15, hh/2 - 100),
  };
  
  PGraphics rosettaImg = createGraphics(385, 145);

  Rosetta() {
    position = ps[0];
    center = ps[1];
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    doScaling = true;
    scaling = 0;
    end = false;
    
    rosettaImg.beginDraw();
    rosettaImg.noStroke();
    rosettaImg.background(55, 105, 125, 0);
    rosettaImg.rectMode(CORNER);
    rosettaImg.translate(190, 71);
      //solar wings
      rosettaImg.strokeWeight(2);
      rosettaImg.stroke(55, 105, 125);
      rosettaImg.line(-25, 16, -35, 10);
      rosettaImg.line(-26, 25, -35, 33);
      rosettaImg.fill(102, 180, 201);
      rosettaImg.quad(-31, 3, -132, 24, -131, 42, -31, 37);
      rosettaImg.fill(110, 190, 213);
      rosettaImg.quad(41, -6, 183, -25, 193, 18, 47, 34);
      //face
      rosettaImg.fill(196, 229, 238);
      rosettaImg.quad(-25, 0, 25, -10, 30, 40, -25, 40);
      rosettaImg.fill(116, 147, 163);
      rosettaImg.quad(25, -10, 35, -5, 38, 35, 30, 40);
      //smile
      rosettaImg.ellipse(-12, 10, 3, 7);
      rosettaImg.ellipse(4, 7, 3, 7);
      rosettaImg.noFill();
      rosettaImg.pushMatrix();
      rosettaImg.rotate(radians(-5));
      rosettaImg.arc(-4, 18, 35, 18, radians(-20), radians(180));
      rosettaImg.popMatrix();
      //solar wings [2]
      rosettaImg.line(41, 3, 33, 10);
      rosettaImg.line(44, 23, 33, 20);
      //solar wings [3]
      rosettaImg.line(-118, 25, -117, 38);
      rosettaImg.line(-92, 19, -91, 36);
      rosettaImg.line(-60, 13, -59, 35);
      rosettaImg.line(73, -7, 79, 26);
      rosettaImg.line(108, -10, 115, 21);
      rosettaImg.line(147, -15, 154, 17);
      //antenna
      rosettaImg.line(14, -9, 9, -42);
      rosettaImg.line(6, -7, 9, -42);
      rosettaImg.fill(81, 129, 148);
      rosettaImg.ellipse(8, -47, 11, 22);
      rosettaImg.fill(196, 229, 238);
      rosettaImg.ellipse(5, -47, 11, 24);
      rosettaImg.strokeWeight(4);
      rosettaImg.line(-7, -47, 4, -47);
    rosettaImg.endDraw();
  }

  void move() {
    PVector dir = PVector.sub(center, position);
    dir.normalize();
    dir.mult(0.06);
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(1);
    if(end) velocity.limit(0.3);
    position.add(velocity);
    acceleration.mult(0);
  }  

  //scaling animation in the beginning
  void toBig() {
    scale(scaling);
    scaling += 0.0028;
    if (scaling >= 1) {
      scaling = 1;
      doScaling = false;
    }
  }
  //scaling animation in the end
  void toSmall() {
    scale(scaling);
    scaling -= 0.002;
    if (scaling <= 0.6) {
      scaling = 0.6;
    }
  }

  void drawing() {    
    pushMatrix();
    translate(position.x, position.y);
    if (doScaling) {
      if(!end) toBig();
      else toSmall();
    }
    image(rosettaImg, 0, 0);
    popMatrix();
  }
}