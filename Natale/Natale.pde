/**
 *  +--------------------+
 *  |   CHRISTMAS*GAME   |
 *  +--------------------+
 */

Info info;
int firstGoal = 10; // info.goal iniziale
Button[] button = new Button[3];

PFont myFont;
PFont fontSnow;

color RED = color(162,44,39);
color LIGHT_GREEN = color(182,187,155);
color DARK_GREEN = color(146,152,103);
color BROWN = color(168,118,95);
color GOLD = color(159,130,65);

Images images;

int numTarget = 3;
Target[] target = new Target[numTarget];
PVector[] position = new PVector[numTarget];
SnowMan snowMan;
Tree[] tree = new Tree[2];
ArrayList<Shot> shot = new ArrayList<Shot>();

int numSnow = 20;
Snow[] snow = new Snow[numSnow];
ArrayList<Star> star = new ArrayList<Star>();


void setup() {  
  size(650, 400);
  background(LIGHT_GREEN);
  noStroke();
  imageMode(CENTER);
  myFont = createFont("Verdana", 12);
  fontSnow = createFont("Arial Unicode MS", 20);
  textFont(myFont);
  textLeading(12);
  textAlign(CENTER, CENTER);
  frameRate(60);
  
  images = new Images();
  
  info = new Info(firstGoal);
  
  position[0] = new PVector(width*0.52, height*0.69);
  position[1] = new PVector(width*0.68, height*0.72);
  position[2] = new PVector(width*0.41, height*0.56);
  
  snowMan = new SnowMan(position[0]);  
  tree[0] = new Tree(position[1]); // big tree
  tree[1] = new Tree(position[2]); // small tree

  for(int i = 0; i < numTarget; i++) {
    target[i] = new Target(position[i]);
  }
  
  for (int i = 0; i < numSnow; i++) {
    snow[i] = new Snow();
  }
  
  button[0] = new Button(width/4, height/3.5, "+5");
  button[1] = new Button(width*3/4, height/3.5, "-5");
  button[2] = new Button(width/2, height/2.5, "Nuova Partita");
}

 
void draw() {
  image(images.backgroundPG, width/2, height/2);
  info.scritte();
  
  for(Target t : target) {
    t.move();
  }
  
  for (int i = 0; i < star.size(); i++) {
    star.get(i).drawStar();
    if (star.get(i).pos.y < 0) {
      star.remove(i);
      i--;
    }
  }
  
  snowMan.drawSnowMan();
  tree[0].drawTree();
  tree[1].drawTree();
  
  for(int i = 0; i < shot.size(); i++) {
    shot.get(i).move();
    if (shot.get(i).out) {
      shot.remove(i);
      i--;
    }
  }
  
  for (Snow s : snow) {
    s.drawSnow();
  }
   
  if (info.hit >= info.goal) {
    info.end = true;
    info.ending();
  }
}


void mousePressed() {
  if (!info.end) {
    shot.add(new Shot(mouseX, mouseY));
    info.used++;
    
  } else {
    for (int i = 0; i < 3; i++) {
      if (dist(mouseX, mouseY, button[i].x, button[i].y) < 50) {
        
        if (i == 0) firstGoal += 5;
        else if (i == 1) firstGoal -= firstGoal > 5 ? 5 : 0;
        else info = new Info(firstGoal);
      }
    }
  }
  
}
