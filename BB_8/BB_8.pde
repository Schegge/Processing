BB8 bb8;

void setup() {
  size(500, 500);
  noStroke();
  imageMode(CENTER);
  
  bb8 = new BB8();
}

void draw() {
  background(132);
  
  bb8.drawing(); 
}