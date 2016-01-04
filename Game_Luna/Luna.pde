class Luna {
  float _posYu = height*0.3;
  float _posYd = height*0.6;
  
  PVector pos = new PVector(width/2+52.5, _posYd);
  PVector vel = new PVector(0, 0);
  float angle = 0;
  
  // w = 185; h = 135
  
  // 1' riga : posizione
  // 2' riga : vertex()
  // +' righe: bezierVertex()
  int[] CORPO = {
    0, 0,
       
    - 10,   20,
    - 40,   40, - 60,   30, -130,   25,
    -145,   35, -140,   50, -135,   55,
    -125,   70, - 10,  110,   10,   25
  };
  
  int[] TESTA = {
    18, -25,
       
    - 18,   25,
    - 20,   13, - 15,    7,    0,    0,
      15,    0,   10,   15,   35,   20,
      28,   45, - 10,   25,    8,   30
  };
  
  int[] ORECCHIA1 = {
    TESTA[0]+8, TESTA[1]+5,
    
       0,    0,
    - 14, - 25, - 16, - 23, - 20,    2
  };
  int[] ORECCHIA2 = {
    ORECCHIA1[0]-5, ORECCHIA1[1]-3,
    
       0,    0,
    -  7, - 14, -  9, - 12, -  7,    2
  };
  
  int[] NASO = {
    TESTA[0]+35, TESTA[1]+20,
      
       0,    0,
    -  2,    7, -  4,    8, -  7, -  1
  };
  
  int[] OCCHIO = {
    TESTA[0]+12, TESTA[1]+13,
    
       0,    0,
    -  4,    4, -  8, -  2, -  1, -  3
  };
  
  int[] ZAMPA_A = {    
    CORPO[0]+CORPO[2]-4, CORPO[1]+CORPO[3]+35,
    
       0,    0,
    -  5,   67,   10,   43,   10,   57,
    - 15,   57, - 10,   50, - 15,   10
  };
  int[] ZAMPA_A1 = {
    ZAMPA_A[0]-8, ZAMPA_A[1]-10,
    
       0,    0,
    -  5,   67,   10,   43,   10,   57,
    - 15,   57, - 10,   50, - 15,   10
  };
  
  int[] ZAMPA_P = {
    CORPO[0]+CORPO[10]+25,CORPO[0]+CORPO[11]+20,
    
       0,    0,
      20,   25,    0,   45,   20,   55,
      20,   60,   20,   60,    2,   57,
    -  5,   45,    0,   35, - 15,   18,
    - 20,   10, - 22, -  5, - 20, - 16
  };
  int[] ZAMPA_P1 = {
    ZAMPA_P[0]+5, ZAMPA_P[1]-10,
    
       0,    0,
      20,   25,    0,   45,   20,   55,
      20,   60,   20,   60,    2,   57,
    -  5,   45,    0,   35, - 15,   18,
    - 20,   10, - 22, -  5, - 20, - 16
  };
  
  int[] CODA = {
    CORPO[0]+CORPO[10]+20,CORPO[0]+CORPO[11]-5,
    
    -  5,    5,
    - 58, -  5,   40, - 80,    5, -  5,
      15, - 50, - 30,    0,   10,    0
  };
  
  /////////
  Luna() {}
  
  void display() {
    move();
    
    pushMatrix();
      translate(pos.x, pos.y);
      
      strokeWeight(5);
      stroke(BLACK, 7);
      drawing();
    popMatrix();
    
    if (frameCount % 40 == 0) {
      CODA[8] += CODA[8] == 5 ? 5 : -5;
      angle = angle == 0 ? radians(5) : 0;
    }   
  }
  
  void move() {
    if (mousePressed) {
      vel.add(new PVector(0, -3));
    } else {
      vel.add(new PVector(0, 3));
    }
    pos.add(vel);
    
    vel.limit(1);    
    pos.y = constrain(pos.y, _posYu, _posYd);
  }
  
  void drawing() {  
    beginShape();
      part(ZAMPA_A1, color(FUR, 60));
      part(ZAMPA_P1, color(FUR, 60));
      part(CORPO, FUR);
      part(ZAMPA_A, FUR);
      part(ZAMPA_P, FUR);
      part(CODA, FUR);
      pushMatrix();
        translate(TESTA[2], TESTA[3]);
        rotate(angle);
        part(TESTA, FUR);
        part(ORECCHIA1, FUR);
        part(ORECCHIA2, PINK);
        part(OCCHIO, BLACK);
        part(NASO, BLACK);
      popMatrix();
    endShape();
  }
  
  void part(int[] numeri, color c) {
    int n = numeri.length;
    pushMatrix();
      translate(numeri[0], numeri[1]);
      pushStyle();
        fill(c);
        beginShape();
          vertex(numeri[2], numeri[3]);
          for (int i = 4; i < n; i += 6) {
            bezierVertex( numeri[i  ], numeri[i+1],
                          numeri[i+2], numeri[i+3],
                          numeri[i+4], numeri[i+5] );
          }
        endShape();
      popStyle(); 
    popMatrix();
  }
  
}