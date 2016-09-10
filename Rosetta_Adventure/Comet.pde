class Comet {
  PVector position;
  PVector center;
  PVector velocity;
  PVector acceleration;
  float rotation;
  float comaOpacity;
  boolean end = false;
  
  PVector[] ps = {
    new PVector(     - 90, hh/2 + 50),
    new PVector(ww/2 - 80, hh/2 + 90),
    new PVector(ww/2 - 25, hh/2 + 60),
  };
  
  PGraphics cometImg = createGraphics(120, 120);

  Comet() {
    position = ps[0];
    center = ps[1];
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    rotation = 0;
    comaOpacity = 0;
    
    cometImg.beginDraw();
    cometImg.background(120, 0);
    cometImg.translate(65, 70);
    cometImg.noStroke();
      //border
      cometImg.fill(120);
      cometImg.ellipse(0, 0, 103, 83);
      cometImg.ellipse(-20, -20, 87, 67);
      //bottom
      cometImg.fill(155);
      cometImg.ellipse(0, 0, 100, 80);
      cometImg.fill(135);
      cometImg.ellipse(-4, -7, 67, 56);
      //top
      cometImg.fill(172);
      cometImg.ellipse(-20, -20, 84, 64);
      cometImg.rotate(radians(-15));
      cometImg.fill(183);
      cometImg.ellipse(-23, -32, 45, 34);
      cometImg.fill(193);
      cometImg.ellipse(-24, -33, 31, 22);
    cometImg.endDraw();
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
    if(!end) {
      comaOpacity += 0.2;
      if (comaOpacity >= 150) {
        comaOpacity = 150;
      }
    } else {
      comaOpacity -= 0.2;
      if (comaOpacity <= 0) {
        comaOpacity = 0;
      }
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
      image(cometImg, 0, 0);
    popMatrix();
    popStyle();
  }
}