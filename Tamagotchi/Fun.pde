class Fun {  
  int lvl;
  int currentStars;
  int totalStars;
  float frameStart;
  
  ArrayList<Star> star = new ArrayList<Star>();
  int totalHit;
  
  Fun() {
    lvl = game.lvl;
    currentStars = 0;
    totalStars = lvl*5;
    totalHit = 0;
    frameStart = frameCount;
  }
  
  void funGame() {    
    if ( currentStars < totalStars ) {      
      if ( frameCount - frameStart > 50 + 80*currentStars - lvl*4 ) {
        star.add(new Star());
      }
    } else {
      if ( star.size() == 0 && game.playing ) {
        // @TODO show aniamtion for score?
        if ( totalHit == totalStars ) game.lvl++;
        game.playing = false;
        game.scene = -1;
        println("lvl: " + game.lvl);
      }
    }
    
    for (int i = 0; i < star.size(); i++) {
      star.get(i).display();
      if (star.get(i).y > height ) {
        star.remove(i);
        i--;
      } else if (star.get(i).hit) {
        star.remove(i);
        i--;
        totalHit++;
      }
    }
    
    pushStyle();
      fill(BLACK);
      text(totalHit+ "/" + totalStars, width/2, tama.h*7);
    popStyle();
  }

  class Star {    
    int x;
    int y;
    int w;
    int h;
    int type;    
    boolean hit;
    
    int nois;
    
    Star() {
      type = round(random(1));
      w = type == 0 ? images.starSmall.width : images.starMedium.width;
      h = type == 0 ? images.starSmall.height : images.starMedium.height;
      x = round(random(w, width-w*2));
      y = -h;
      currentStars++;
      nois = (int)random(100000);
    }
    
    void display() {
      isHit();
      
      pushMatrix();
      translate(x, y);
        if ( type == 0 ) image(images.starSmall, 0, 0);
        else image(images.starMedium, 0, 0);
      popMatrix();
      
      if ( frameCount % 4 == 0 ) {
        y += n;
        x += round(noise(x*1000, y)*random(-n*3, n*3));
        x = constrain(x, w, width-w*2);
      }
    }
    
    void isHit() {
      if ( x + w + n   > tama.x && x + n   < tama.x + tama.w
        && y + h - n > tama.y && y < tama.y + tama.h ) {
        hit = true;
      }
    }
    
  }
  
}