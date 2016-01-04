class Level {
  int numAsts;
  int astsCurrent;
  int astsLeft;
  
  int astsDestroyed;
  int astsCrashed;
  int bulsUsed;
  float points;
  
  boolean end = false;
  
  Level(int numAsts) {
    this.numAsts = numAsts;
    astsCurrent = 0;
    points = 0;
    astsDestroyed = 0;
    astsCrashed = 0;
    astsLeft = numAsts;    
  }
  
  void instructions() {    
    pushStyle();
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    
    fill(255, 255, 255, 50);
    rect(width*0.5, height*0.2, width*0.7, height*0.3);
    
    fill(255, 255, 255);
    text(lang.istructions[0] + numAsts + lang.istructions[1], width*0.5, height*0.2);
    
    popStyle(); 
  }
  
  void stats() {
    astsLeft = numAsts - astsDestroyed - astsCrashed;
    
    pushStyle();
    textAlign(LEFT, TOP);
      
    fill(255, 255, 255, 150);
    text(lang.stats + astsLeft, 10, 10);
    
    popStyle();      
  }
  
  void fine() {
    points = map(astsDestroyed, 0, numAsts, 0, 100) - (float)abs(bulsUsed-numAsts)/2;
    if ( points < 0 ) points = 0;
    
    pushStyle();
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    
    fill(255, 255, 255, 50);
    rect(width*0.5, height*0.2, width*0.6, height*0.2);
    fill(0, 0, 0, 40);   
    rect(width*0.5, height*0.92, width*0.4, height*0.1);
    
    fill(#ffffff);
    text(lang.fine[0] + points +
         lang.fine[1] + astsDestroyed +
         lang.fine[2] + numAsts +
         lang.fine[3] + bulsUsed,
         width*0.5, height*0.2);    
    text(lang.newGame, width*0.5, height*0.92);
    
    popStyle();  
  }
  
}

void chooseLang() {  
  pushStyle();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  
  fill(255, 255, 255, 50);
  rect(width*0.5, height*0.2, width*0.7, height*0.3);
  
  fill(255, 255, 255);
  text("Choose your language:\nScegli la tua lingua:\n \nENGLISH     ITALIANO", width*0.5, height*0.2);
  
  popStyle();  
}
