/**
 *  VARIABILI
 **/

PFont myFont;

Ufo ufo;
PVector[] ufoPos = new PVector[20];
int ufoPosLength = ufoPos.length;

int[][] mnts = {
  { 3, -6, 4, 0 },
  { 28, 36, 15, 34, 27, 40 },
  { 34, 55, 24, 32, 63, 53, 11, 52, 51, 37, 66, 51, 61 }
};
color[] mntsCol = { color(73, 173, 155), color(25, 71, 28), color(30, 33, 28) };

/**
 *  PROGRAMMA PRINCIPALE
**/

void setup() {
  size(400, 500);
  noStroke();

  myFont = createFont("Franklin Gothic Heavy", 46);
  textFont(myFont);
  textLeading(40);
  textAlign(CENTER, CENTER);
    
  ufoPos[0] = new PVector(width / 2, -25);
  ufoPos[1] = new PVector(width / 2, height / 2.5);
  for (int i = 2; i < ufoPosLength; i++) {
      ufoPos[i] =  new PVector( round(random(60, width - 60)), round(random(60, height - 170)) );
  }
  
  ufo = new Ufo();  
}

void draw() {
  background(93, 194, 177);
  mountains();
  believe();
  ufo.drawing();
  ufo.move();
  ufo.update();
}

/**
 *  FUNZIONI
**/

void mountain(int n, int[] ver, color clor) {
  int h = 150;
  
  pushMatrix();
    translate(0, height - h);
    
    fill(clor);
    beginShape();
      vertex(0, h); // 0, height
      for (int i = 0; i <= n; i++) {
          vertex(i * width / n, ver[i]);
      }
      vertex(width, h); // 0, height
    endShape();
    
  popMatrix();
}

void mountains() {
  for (int i = 0; i < mnts.length; i++) {
    mountain(mnts[i].length-1, mnts[i], mntsCol[i]);
  }
}

void believe() {
  pushMatrix();
    translate(width / 2, height - 50);
    
    fill(255);
    text("I  W A N T  T O\nB E L I E V E", 0, 0);
    
  popMatrix();
}
    
class Ufo {
  PVector position = ufoPos[0];
  PVector center = ufoPos[1];
  PVector acceleration = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  
  void move() {
    PVector dir = PVector.sub(center, position);
    dir.normalize();
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(1.2);
    position.add(velocity);
  } 
    
  void update() {
    for (int i = 0; i < ufoPosLength; i++) {
      if (center == ufoPos[i]) {
        if ( ( position.x >= center.x - 5 && position.x <= center.x + 5 ) &&
             ( position.y >= center.y - 5 && position.y <= center.y + 5 ) ) {
          int j = i + 1;
          if (j == 10) {
            center = ufoPos[1];
          } else {
            center = ufoPos[j];
          }
        }
      }
    }
  }
  
  void drawing() {
    float programTime = millis() * 0.001;
    
    pushMatrix();    
      translate(position.x, position.y);
      
      if (programTime > 1 && round(programTime) % 3 == 0) {
        // il raggio
        fill(223, 224, 179, 100);
        beginShape();
          vertex(-55, height - position.y);
          vertex(-20, 0);
          vertex(20, 0);
          vertex(55, height - position.y);
        endShape();
      }
      
      // il sopra
      fill(64, 97, 79);
      beginShape();
        vertex(-50, 0);
        vertex(-15, -8);
        vertex(0, -15);
        vertex(15, -8);
        vertex(50, 0);
      endShape();
      
      // il sotto
      fill(30, 33, 28);
      beginShape();
        vertex(50, 0);
        vertex(25, 7);
        vertex(0, 9);
        vertex(-25, 7);
        vertex(-50, 0);
        vertex(0, -3);
      endShape();
      
    popMatrix();
  }
   
} // fine class Ufo