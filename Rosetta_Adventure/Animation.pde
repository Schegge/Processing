class Animation {
  String[] scritte = {
    /* 0*/ "once upon a time...", 
    /* 1*/ "a spacecraft called rosetta", 
    /* 2*/ "and her brother philae", 
    /* 3*/ "set off on an adventure", 
    /* 4*/ "a long long journey to visit a comet", 
    /* 5*/ "called 67p/churyumov-gerasimenko", 
    /* 6*/ "after a 10-year journey", 
    /* 7*/ "they have finally reached their destination", 
    /* 8*/ "rosetta's exciting mission was to follow the comet", 
    /* 9*/ "as it travelled around the sun", 
    /*10*/ "she would learn all about it", 
    /*11*/ "and how it changes as it gets warmer and warmer", 
    /*12*/ "while philae would visit the surface", 
    /*13*/ "as rosetta got closer to the comet", 
    /*14*/ "she realized its shape was rather strange", 
    /*15*/ "after a long night of preparation", 
    /*16*/ "philae was ready for separation and landing", 
    /*17*/ "the moment he had been dreaming of", 
    /*18*/ "had finally arrived", 
    /*19*/ "he had reached the surface of the comet", 
    /*20*/ "but all was not right", 
    /*21*/ "his harpoons did not fire", 
    /*22*/ "he was rising from the surface again", 
    /*23*/ "but eventually he came back down again", 
    /*24*/ "it took him just over two days to conduct", 
    /*25*/ "all the experiments he had brought with him", 
    /*26*/ "after all his hard work", 
    /*27*/ "philae began to feel tired", 
    /*28*/ "he fell into a deep sleep safe in the knowledge", 
    /*29*/ "that he did his main job well", 
    /*30*/ "...", 
    /*31*/ ".....", 
    /*32*/ ".......", 
    /*33*/ "rosetta has been waiting for philae to wake up", 
    /*34*/ "but her brother has not yet reported back"             
  };
  int textsLength = scritte.length;
  Texts[] texts = new Texts[textsLength];
  
  float timePlay; //time passed in play
  float timeDraw; //time passed in animation
  int time; //every text appear for 3 seconds
  float[] startTime = new float[textsLength]; //when each text starts

  float[][] stars = new float[20][3];
  int starsLength = stars.length;

  int endBackOpacity = 1;
  int endFinOpacity = 1;
  float endRotation = 0;
  float endRotRate = 0.3;
  
  
  Animation() {
    for (int i = 0; i < starsLength; i++) {
      stars[i][0] = random(ww);
      stars[i][1] = random(hh);
      stars[i][2] = random(6);
    }
  
    time = 3;
    for (int i = 0; i < textsLength; i++) {
      startTime[i] = 2 + time * i;
      texts[i] = new Texts(scritte[i]);
    }
  }
  
  
  void animation() {
    cursor(ARROW);
    timeDraw = millis()*0.001 - timePlay;
    for (int i = 0; i < textsLength; i++) {
      if (timeDraw > startTime[i] && timeDraw <= startTime[i] + time) {
        texts[i].drawing();
      }
    }
    rosetta.drawing();
    rosetta.move();
    if (timeDraw > startTime[2] && timeDraw <= startTime[17]) {
      philae.x = rosetta.position.x;
      philae.y = rosetta.position.y+55;
      philae.drawingR();
    }
    if (timeDraw > startTime[12]) {
      comet.drawing();
      comet.move();
    }
    if (timeDraw > startTime[13]) {
      rosetta.center = rosetta.ps[2];
    }
    if (timeDraw > startTime[17]) {
      philae.movingToComet = true;
      philae.drawingC();
      philae.move();
      philae.rotation++;
    }
    if ( (timeDraw > startTime[17] && timeDraw <= startTime[22]) || timeDraw > startTime[23]) {
      philae.xDestination = comet.position.x;
      philae.yDestination = comet.position.y;
    }
    if (timeDraw > startTime[18]) {
      rosetta.center = rosetta.ps[3];
    }
    if (timeDraw > startTime[22] && timeDraw <= startTime[23]) {
      philae.xDestination = comet.position.x + 65;
    }
    if (timeDraw > startTime[27]) {
      philae.x = comet.position.x;
      philae.y = comet.position.y;
      comet.center = comet.ps[2];
    }
    if (timeDraw > startTime[28]) {
      philae.sleeping = true;
    }
    if (timeDraw > startTime[29]) {
      comet.coma();
    }
    if (timeDraw > startTime[34] + time) {
      ending();
    }
  }
  
  
  void play() {
    if (mouseX > ww/2 - 45 && mouseX < ww/2 + 45 && mouseY > hh/2 - 45 && mouseY < hh/2 + 45) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
    timePlay = millis()*0.001;
    pushStyle();
    fill(255, 255, 255, 50);
    ellipse(ww/2, hh/2, 90, 90);
    fill(255, 255, 255, 100);
    strokeWeight(2);
    stroke(255, 255, 255, 160);
    triangle(ww/2 - 20, hh/2 - 30, ww/2 - 20, hh/2 + 30, ww/2 + 35, hh/2);
    fill(255, 255, 255, 180);
    textSize(17);
    text("play", ww/2, hh/2);
    popStyle();
  }
  
  
  void ending() {
    pushStyle();
    noStroke();
    fill(40, 127, 155, endBackOpacity);
    rectMode(CORNER);
    rect(0, 0, ww, hh);
    textSize(58);
  
    pushMatrix();
    translate(ww/2, hh/2);
    rotate(radians(endRotation));
    fill(0, 0, 0, endFinOpacity/3);
    text("‹ f i n ›", 2, 2);
    fill(255, 255, 255, endFinOpacity);
    text("‹ f i n ›", 0, 0);
    popMatrix();
  
    textSize(10);
    text("...until the next news.", ww/1.3, hh/1.3);
    popStyle();
    
    endBackOpacity++;
    if (endBackOpacity >= 255) {
      endBackOpacity = 255;
      endFinOpacity++;
      if (endFinOpacity >= 255) {
        endFinOpacity = 255;
      }
      endRotation += endRotRate;
      if (endRotation >= 10) {
        endRotRate = -endRotRate;
      }
      if (endRotation <= -10) {
        endRotRate = -endRotRate;
      }
    }
  }
  
  void space() {
    background(40, 127, 155);
    for (int i = 0; i < starsLength; i++) {
      stroke(255);
      strokeWeight(stars[i][2]);
      point(stars[i][0], stars[i][1]);
      stars[i][0]++;
      if ( stars[i][0] > ww + stars[i][1] / 2 ) {
        stars[i][2] = random(6);
        stars[i][1] = random(hh);
        stars[i][0] = -stars[i][2] / 2;
      }
    }
    noStroke();
    rectMode(CENTER);
    //lighter blue in the middle
    for (int i = 0; i < 10; i++) {
      fill(52, 153, 173, 200-i*20);
      rect(ww/2, hh/2 - 5 - i*10, ww, 10);
      rect(ww/2, hh/2 + 5 + i*10, ww, 10);
    }
  }
  
}