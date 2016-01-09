/**
 *  LUNA
 */

Game game;
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

  game = new Game();
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
  
}


void mousePressed() {
  if (luna.nJump < 2) luna.jump = true;  
}