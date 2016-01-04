class Info {
  int goal;
  int used = 0;
  int hit = 0;  
  int punti;
  
  boolean end = false;
  
  String buonNatale = "Buon Natale";
  String istruzioni;
  
  Info(int goal) {
    this.goal = goal;    
    istruzioni = "Colpisci " + goal + " omini di marzapane"
               + "\ncol minor numero di colpi possibile.";
  }
  
  void scritte() {
    pushStyle();
    textSize(29);
    fill(255, 100);
    text(buonNatale, width/2+2, height/6+2);
    fill(RED);
    text(buonNatale, width/2, height/6);
    popStyle();

    fill(GOLD);
    text(istruzioni, width/2, height/4);
    
    if (hit < goal) {
      fill(255);
      text("COLPITI: " + hit, width/2, height/2.5);
    }
  }
  
  void ending() {
    punti = round(map(used, goal, goal*3, 100, 0));
    if (punti < 0) punti = 0;
    //punti = used < goal*3 ? round(map(used, goal, goal*3, 100, 0)) : 0;
    
    pushStyle();
    fill(0, 100);
    rect(0, 0, width, height);
    
    fill(255);
    textSize(40);
    text("Punteggio: " + punti + "%", width/2, height*2/3);
    popStyle();
    
    button[0].drawButton("");
    button[1].drawButton("");
    button[2].drawButton("\n" + firstGoal);
  }  
}