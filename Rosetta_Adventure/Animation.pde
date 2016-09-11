class Animation {
  String[] scritte = {
    /* 0*/ "once upon a time...",
    /* 1*/ "a spacecraft called rosetta",
    /* 2*/ "and her brother philae",
    /* 3*/ "set off on an adventure",
    /* 4*/ "a long long journey to visit a comet",
    /* 5*/ "called 67p/churyumov-gerasimenko",
    /* 6*/ "after a 10-year journey",
    /* 7*/ "they finally reached their destination",
    /* 8*/ "rosetta's exciting mission was to follow the comet",
    /* 9*/ "as it travelled around the sun",
    /*10*/ "while philae would visit the surface",
    /*11*/ "as rosetta got closer to the comet",
    /*12*/ "she realized its shape was rather strange",
    /*13*/ "after a long night of preparation",
    /*14*/ "philae was ready for separation and landing",
    /*15*/ "he reached the surface of the comet",
    /*16*/ "but all was not well",
    /*17*/ "his harpoons did not fire",
    /*18*/ "he rised from the surface",
    /*19*/ "but eventually came back down again",
    /*20*/ "it took him just over two days to conduct",
    /*21*/ "all the experiments he had brought with him",
    /*22*/ "after all his hard work",
    /*23*/ "philae began to feel tired",
    /*24*/ "he fell into a deep sleep safe in the knowledge",
    /*25*/ "that he did his main job well",
    /*26*/ "...",
    /*27*/ "......",
    /*28*/ "rosetta was waiting for philae to wake up",
    /*29*/ "not even knowing where he had landed",
    /*30*/ "but her brother didn't report back for a long time",
    /*31*/ "time passed and briefly he spoke to her",
    /*32*/ "before losing contact again",
    /*33*/ "rosetta found him again just before",
    /*34*/ "the end of her adventure",
    /*35*/ "crushing into the comet's surface",
    /*36*/ "to rest forever near her brother"
  };
  int textsLength = scritte.length;
  Texts[] texts = new Texts[textsLength];
  
  float timePlay; //time passed in play
  float timeDraw; //time passed in animation
  float time = 60*3; //every text appear for 3 seconds, frameRate=60
  float[] startTime = new float[textsLength]; //when each text starts

  float[][] stars = new float[30][3];
  int starsLength = stars.length;

  int endBackOpacity = 1;
  int endFinOpacity = 1;
  float endRotation = 0;
  float endRotRate = 0.3;
  
  PGraphics finImg = createGraphics(187, 60);
  
  Animation() {
    for (int i = 0; i < starsLength; i++) {
      stars[i][0] = random(ww);
      stars[i][1] = random(hh);
      stars[i][2] = random(6);
    }
    
    for (int i = 0; i < textsLength; i++) {
      startTime[i] = 2 + time * i;
      texts[i] = new Texts(scritte[i]);
    }
    
    finImg.beginDraw();
    finImg.background(100, 0);
    finImg.textSize(58);
    finImg.translate(0, 53);
      finImg.fill(0, 0, 0, 100);
      finImg.text("‹ f i n ›", 2, 2);
      finImg.fill(255, 255, 255);
      finImg.text("‹ f i n ›", 0, 0);
    finImg.endDraw();
  }
  
  
  void animation() {
    cursor(ARROW);
    timeDraw = frameCount - timePlay;
    
    for (int i = 0; i < textsLength; i++) {
      if (timeDraw > startTime[i] && timeDraw <= startTime[i] + time) {
        texts[i].drawing();
      }
    }
    
    rosetta.move();
    
    if (timeDraw > startTime[2] && timeDraw <= startTime[14]) {
      philae.x = rosetta.position.x;
      philae.y = rosetta.position.y + 55;
      philae.drawingR();
    }
    if (timeDraw > startTime[10]) {
      comet.drawing();
      comet.move();
    }
    if (timeDraw > startTime[11]) {
      rosetta.center = rosetta.ps[2];
    }
    if (timeDraw > startTime[14]) {
      philae.movingToComet = true;
      philae.drawingC();
      philae.move();
      philae.rotation++;
    }
    if ( (timeDraw > startTime[14] && timeDraw <= startTime[18]) || timeDraw > startTime[19]) {
      philae.xDestination = comet.position.x;
      philae.yDestination = comet.position.y;
    }
    if (timeDraw > startTime[14]) {
      rosetta.center = rosetta.ps[3];
    }
    if (timeDraw > startTime[18] && timeDraw <= startTime[19]) {
      philae.xDestination = comet.position.x + 80;
    }
    if (timeDraw > startTime[20]) {
      comet.center = comet.ps[2];
    }
    if (timeDraw > startTime[23]) {
      philae.x = comet.position.x;
      philae.y = comet.position.y;
    }
    if (timeDraw > startTime[24]) {
      philae.sleeping = true;
    }
    if (timeDraw > startTime[25]) {
      comet.coma();
    }
    if (timeDraw > startTime[31]) {
      comet.end = true;
    }
    if (timeDraw > startTime[35]) {
      rosetta.doScaling = true;
      rosetta.end = true;
      rosetta.center = new PVector(comet.position.x, comet.position.y);
    }
    
    rosetta.drawing();
    
    if (timeDraw > startTime[36]) {
      ending();
    }
  }
  
  
  void play() {
    if (mouseX > ww/2 - 45 && mouseX < ww/2 + 45 && mouseY > hh/2 - 45 && mouseY < hh/2 + 45) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
    timePlay = frameCount;
    pushStyle();
    fill(255, 255, 255, 50);
    ellipse(ww/2, hh/2, 90, 90);
    fill(255, 255, 255, 100);
    strokeWeight(2);
    stroke(255, 255, 255, 160);
    triangle(ww/2 - 20, hh/2 - 30, ww/2 - 20, hh/2 + 30, ww/2 + 35, hh/2);
    fill(255, 255, 255, 180);
    textSize(17);
    text("play", ww/2, hh/2-2);
    popStyle();
  }
  
  
  void ending() {
    pushStyle();
    noStroke();
    fill(40, 127, 155, endBackOpacity);
    rectMode(CORNER);
    rect(0, 0, ww, hh);
    popStyle();
  
    pushStyle();
    pushMatrix();
    tint(255, endBackOpacity);
    translate(ww/2, hh/2);
    rotate(radians(endRotation));
      image(finImg, 0, 0);
    popMatrix();
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