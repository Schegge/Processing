// variabili

float[][] positions = new float[20][2];
int snowBig;

// programma principale

void setup() { 
  size(400, 400);

  for (int i = 0; i < positions.length; i++) {
    positions[i][0] = random(width);
    positions[i][1] = random(height);
  }

  snowBig = 4;
}

void draw() {  
  background(106, 160, 168);
  snow();
  mountains();
};

// funzioni

void snow() {  
  for (int i = 0; i < positions.length; i++) {
    pushStyle();
    strokeWeight(1);
    stroke(255, 255, 255, 150);
    noFill();
    ellipse(positions[i][0], positions[i][1], snowBig, snowBig);    
    popStyle();

    positions[i][0] += random(-2, 2);
    positions[i][1] += random(1, 3);
    if (positions[i][1] > 400) {
      positions[i][0] = random(width);
      positions[i][1] = -snowBig/2;
    }
  }
}

void mountains() {
  pushStyle();
  noStroke();
  fill(84, 67, 34);
  triangle(121, 339, -76, 400, 264, 400);
  fill(105, 85, 48);
  triangle(300, 350, 146, 400, 429, 400);
  fill(214, 214, 214);
  triangle(121, 339, 70, 354, 174, 361);
  popStyle();
}