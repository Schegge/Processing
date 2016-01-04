/**
 *  LUNA
 */

Luna luna;

color BACKG = color(206,151,112);
color FUR = color(242, 233, 225);
color PINK = color(214, 171, 177);
color BLACK = color(45, 45, 41);


void setup() {
  size(900, 600);
  noStroke();
  textSize(height/9);
  textAlign(CENTER, CENTER);
  
  luna = new Luna();
}

void draw() {
  background(BACKG);
  
  pushStyle();
    fill(BLACK, 5);
    text("LUNA", width/2+4, height/4+4);
    fill(FUR, 50);
    text("LUNA", width/2, height/4);
  popStyle();
  
  luna.display();
  
  /*
  pushStyle();
  rectMode(CENTER);
  fill(0, 100);
  rect(width/2, height*0.6+50, 185, 135);  
  ellipse(luna.pos.x, luna.pos.y, 10, 10);
  popStyle();
  */
}