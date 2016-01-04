class Comet {
  PVector position;
  PVector center;
  PVector velocity;
  PVector acceleration;
  float rotation;
  float comaOpacity;
  
  PVector[] ps = {
    new PVector(     - 90, hh/2 + 50),
    new PVector(ww/2 - 80, hh/2 + 90),
    new PVector(ww/2 - 25, hh/2 + 70),
  };

  Comet() {
    position = ps[0];
    center = ps[1];
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    rotation = 0;
    comaOpacity = 0;
  }

  void move() {
    PVector dir = PVector.sub(center, position);
    dir.normalize();
    dir.mult(5);
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(0.5);
    position.add(velocity);
    acceleration.mult(0);
    rotation += 1;
  }

  void coma() {
    pushMatrix();
    pushStyle();
    translate(position.x - 75, position.y);
    comaOpacity += 0.2;
    if (comaOpacity >= 150) {
      comaOpacity = 150;
    }
    noStroke();

    fill(255, 255, 255, comaOpacity);
    beginShape();
    vertex(0, 0);
    bezierVertex(0, -24, 35, -155, 270 + random(-5, 5), 0);
    bezierVertex(35, 155, 0, 24, 0, 0);
    endShape();
    popMatrix();
    popStyle();
  }

  void drawing() {
    pushStyle();
    pushMatrix();
    translate(position.x, position.y);
    rotate(radians(rotation));
    noStroke();

    //border
    fill(120);
    ellipse(0, 0, 103, 83);
    ellipse(-20, -20, 87, 67);
    //bottom
    fill(155);
    ellipse(0, 0, 100, 80);
    fill(135);
    ellipse(-4, -7, 67, 56);
    //top
    fill(172);
    ellipse(-20, -20, 84, 64);
    rotate(radians(-15));
    fill(183);
    ellipse(-23, -32, 45, 34);
    fill(193);
    ellipse(-24, -33, 31, 22);
    popMatrix();
    popStyle();
  }
}