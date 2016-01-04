int ww = 400;
int hh = 400;
PFont myFont;

int scene;

Animation animation;
Rosetta rosetta;
Philae philae;
Comet comet;


void setup() {
  size(400, 400);
  
  myFont = createFont("SegoeUI", 34);
  textFont(myFont);
  textAlign(CENTER, CENTER);

  scene = 0;

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
}

void mouseClicked() {
  if (mouseX > ww/2 - 45 && mouseX < ww/2 + 45 && mouseY > hh/2 - 45 && mouseY < hh/2 + 45) {
    if (scene == 0) { 
      scene = 1;
    }
  }
}