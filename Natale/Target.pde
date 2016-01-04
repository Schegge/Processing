class Target {
  PVector pos;
  PVector iniz;
  PVector[] change = new PVector[3];
  float scaling;  
  float time;
  float gap;
  float angle = 0;
  int rand;
  
  boolean hitted = false; // comportamento gestito da Shot.isHit() e move()
  boolean out = false;
  boolean ritorno = false;
  
  Target(PVector pos) {
    this.pos = new PVector(pos.x, pos.y);
    scaling = map(pos.y, height/3, height, 0, 0.7);
    change[0] = new PVector(pos.x, pos.y);
    change[1] = new PVector(pos.x-90*scaling, pos.y);
    change[2] = new PVector(pos.x+90*scaling, pos.y);
    time = frameCount;
    gap = random(0, frameRate*40);
    rand = round(random(1, 2));
  }
  
  void move() {     
     drawTarget();
     
     if (frameCount - time > gap) {       
       if (abs(pos.x-change[0].x) < 20*scaling || hitted) {
         out = false;
       } else {
         out = true;
       }
       
       PVector dir;
       if (!ritorno) {
         angle = map(pos.x, change[0].x, change[rand].x, 0, rand == 2 ? PI/4 : -PI/4);
         dir = PVector.sub(change[rand], pos);
         if (abs(pos.x-change[rand].x) < 1) {
           ritorno = true;
         }
       } else {
         angle = map(pos.x, change[rand].x, change[0].x, rand == 2 ? PI/4 : -PI/4, 0);
         dir = PVector.sub(change[0], pos);
         if (abs(pos.x-change[0].x) < 1) {
           if (hitted) hitted = false;
           ritorno = false;
           time = frameCount;
           gap = random(frameRate*2, frameRate*8);
           rand = round(random(1, 2));
         }
       }
       
       dir.normalize();
       dir.mult(scaling);
       pos.add(dir);
     }
  }
  
  void drawTarget() {
    pushMatrix();
      translate(pos.x, pos.y);
      scale(scaling);
      rotate(angle);
        image(images.targetPG, 0, 0);    
    popMatrix();    
  }  
}