PGraphics clock;

void setup() {
  size(400, 400);  
  noStroke();
  strokeCap(ROUND);

  clock = createGraphics(width, height);
  clock.beginDraw();
    clock.background(48, 41, 49);
    clock.textFont(createFont("Arial", height/30));
    clock.textAlign(CENTER, CENTER);
    clock.translate(width/2, height/2);
      clock.strokeWeight(10);
      clock.stroke(59, 240, 255, 100);
      clock.fill(57, 209, 255);
      clock.ellipse(0, 0, width*0.8, height*0.8);
      clock.fill(48, 41, 49, 10);
      clock.ellipse(0, 0, width*0.05, height*0.05);
      clock.strokeWeight(1);
      clock.stroke(255, 150);
      clock.pushMatrix();
        float angle1 = TWO_PI/60;
        for (int i = 1; i <= 60; i++) {
          int a = i % 5 == 0 ? 3 : 0;
          clock.rotate(angle1);
          clock.line(0, -height*0.37+a, 0, -height*0.38);
        }
      clock.popMatrix();
      clock.fill(255);
      for (int i = 1; i <= 12; i++) {
        float angle2 = map(i, 0, 12, -HALF_PI, HALF_PI*3);
        clock.text(i, cos(angle2)*width*0.34, sin(angle2)*height*0.34-1);
      }
  clock.endDraw();
}

void draw() {  
  background(48, 41, 49);  
  image(clock, 0, 0);
  
  float angleH = map(  hour(), 0, 12, 0, TWO_PI);
  float angleM = map(minute(), 0, 60, 0, TWO_PI);
  float angleS = map(second(), 0, 60, 0, TWO_PI);
  angleH += angleM/12;
  
  pushMatrix();
    translate(width/2, height/2);
    
    pushStyle();
    stroke(252, 69, 185);
    
    strokeWeight(1);    
    pushMatrix();
    rotate(angleS);
    line(0, height*0.04, 0, -height/3.5);
    popMatrix();
    
    strokeWeight(2);    
    pushMatrix();
    rotate(angleM);
    line(0, 0, 0, -height/4.5);
    popMatrix();
    
    strokeWeight(3);
    pushMatrix();
    rotate(angleH);
    line(0, 0, 0, -height/6.5);
    popMatrix();
    
    strokeWeight(2);
    fill(255);
    ellipse(0, 0, 4, 4);
    popStyle();
    
  popMatrix(); 
}
