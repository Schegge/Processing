int ww = 16*44;
int hh = 9*44;
PFont myFont;

int scene = 0;

Animation animation;
Rosetta rosetta;
Philae philae;
Comet comet;

void settings() {
  size(ww, hh);
}

void setup() {
  frameRate(60);
  
  myFont = createFont("SegoeUI", 34);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  
  animation = new Animation();
  rosetta = new Rosetta();
  philae = new Philae();
  comet = new Comet();
}

void draw() {
  animation.space();

  switch(scene) {
  case 0:
    animation.play();
    break; 
  case 1:
    animation.animation();
    break;
  }
  
  //saveFrame("video/frames/####.jpg"); //save frames for video
}

void mouseClicked() {
  if (scene == 0 && mouseX > ww/2 - 45 && mouseX < ww/2 + 45 && mouseY > hh/2 - 45 && mouseY < hh/2 + 45) {
      scene = 1;
  }
}