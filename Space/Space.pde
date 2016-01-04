/**
 *  +--------------+
 *  |  SPACE*GAME  |
 *  +--------------+
 */

Level level;
Lang lang;

int scene = -1; // -1 lang, 0 instructions, 1 game, 2 points and new game
float frameStart;

Earth earth;
Alien alien;

int starsLength = 30;
Stars[] stars = new Stars[starsLength];

ArrayList<Asteroids> asts = new ArrayList<Asteroids>();
ArrayList<Bullets> buls = new ArrayList<Bullets>();

Images images;
PGraphics imgAlien, imgAsts, imgAstsDestr, imgAstsCrash, imgBuls, imgEarth, imgStars;

PFont myFont;


void setup() {
  size(400, 500);
  frameRate(60);
  smooth();
  noStroke();
  imageMode(CENTER);
  
  myFont = loadFont("CourierNewPSMT-13.vlw");
  //myFont = createFont("Courier New", 13);
  textFont(myFont);
  textLeading(15);
  
  level = new Level(20);
  
  images = new Images();
  imgAlien = toColor(images.pxsAlien, 2);
  imgAsts = toColor(images.pxsAsts, 2);
  imgAstsDestr = toColor(images.pxsAstsDestr, 2);
  imgAstsCrash = toColor(images.pxsAstsCrash, 2);
  imgBuls = toColor(images.pxsBuls, 2);
  imgEarth = toColor(images.pxsEarth, 5);
  imgStars = toColor(images.pxsStars, 2);
    
  earth = new Earth();
  alien = new Alien();
  
  for ( int i = 0; i < starsLength; i++ ) {
    stars[i] = new Stars();
  }
}


void mousePressed() {  
  switch(scene) {
    case -1:
      if ( mouseX > width/2 ) lang = new Lang(false); // ita
      else lang = new Lang(true); // eng
      scene = 0;
      break;
      
    case 0:
      scene = 1;
      frameStart = frameCount;
      break;
      
    case 1:
      if (!level.end) buls.add(new Bullets(mouseX, mouseY));
      break;
      
    case 2:
      if ( mouseY > height*0.82 ) {
        asts.clear();
        level = new Level(20);
        /*
         * @TODO other levels
         */
        scene = 0;
      }
      break;
  }  
}


void draw() {
  background(#343848);

  for ( int i = 0; i < starsLength; i++ ) {
    stars[i].update();
  }
  
  earth.drawing();
  
  switch(scene) {  
    case -1:
      chooseLang();
      break;
    
    case 0:
      level.instructions();
      break;
      
    case 2:
    case 1:      
      /*
       * THE GAME
       */
       
      // control if the game is finished
      if ( level.astsLeft <= 0 ) level.end = true;
      
      // asteroids & bullets
      if ( !level.end && level.astsCurrent < level.numAsts 
           && frameCount - frameStart > 50 + 280*level.astsCurrent - 7*sq(level.astsCurrent) ) {
       asts.add(new Asteroids(level.astsCurrent));
       level.astsCurrent++;
      }
      
      for ( int i = 0; i < asts.size(); i++ ) {
         asts.get(i).update();
      }
  
      for ( int i = 0; i < buls.size(); i++ ) {
        buls.get(i).update();
        if ( buls.get(i).out ) {
          buls.remove(i);
          i--;
        }
      }
      
      // stats or points
      if ( !level.end ) {
        level.stats();
      } else {
        level.fine();
        scene = 2;
      }
      break;
  }
  
  alien.update();
}
