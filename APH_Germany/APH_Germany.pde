Ludwig ludwig;
Speech speech;
Heart[] hearts = new Heart[10];
int heartsLength = hearts.length;

PFont myFont;

void setup() {
  size(540, 300);
  frameRate(60);
  noStroke();
  
  myFont = createFont("Georgia", 20);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  textLeading(18);
  
  ludwig = new Ludwig();
  speech = new Speech();
  for ( int i = 0; i < heartsLength; i++ ) {
    hearts[i] = new Heart(
      random(ludwig.w-ludwig.faceW*1.5, ludwig.w+ludwig.faceW*1.5),
      random(ludwig.h+ludwig.faceH*1.4, height)
    );
  }
  
}

void draw() {
  background(#62A7BF);
  
  speech.drawing();
  
  for ( int i = 0; i < heartsLength; i++ ) {
    if ( frameCount > i*60 ) {
      hearts[i].allMethods();
    }
  }
  
  ludwig.drawing();
  ludwig.update();
  if ( frameCount % 240 == 0 ) ludwig.closeEyes = true;
  
}