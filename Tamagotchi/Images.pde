class Images {

  PGraphics sfondo = createGraphics(width, height);
  PGraphics sep;

  PGraphics tamaTesta;
  PGraphics tamaCorpo;
  PGraphics tamaOcchiFeli;
  PGraphics tamaOcchiTris;
  PGraphics tamaOcchiNorm;
  PGraphics tamaOcchiSleep;
  PGraphics tamaOcchiDeath;
  
  PGraphics health;
  PGraphics food;
  PGraphics play;
  PGraphics shower;
  PGraphics light;
  PGraphics menu;  
  
  PGraphics empty;
  PGraphics low;
  PGraphics medium;
  PGraphics high;
  
  PGraphics starSmall;
  PGraphics starMedium;
  
  PGraphics bone;
  PGraphics fish;
  PGraphics water;  
  
  PGraphics poop;
  
  PGraphics sponge;
  PGraphics bubble;
  
  PGraphics syringe;
  
  
  int[][] sepPX = new int[1][width/n];
  
  int[][] tamaTestaPX = {
    { 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0 },
    { 0, 3, 1, 3, 0, 0, 0, 0, 0, 0, 0, 3, 1, 3, 0, 0 },
    { 3, 1, 2, 1, 3, 3, 3, 3, 3, 3, 3, 1, 2, 1, 3, 0 },
    { 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 0 },
    { 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 0 },
    { 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 0 },
    { 0, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 0, 0 },
    { 0, 3, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 3, 0, 0 },
    { 0, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 0, 0 },
    { 0, 0, 3, 1, 1, 1, 3, 3, 3, 1, 1, 1, 3, 0, 0, 0 },
    { 0, 0, 0, 3, 1, 1, 1, 1, 1, 1, 1, 3, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0 }
  };
  
  int[][] tamaCorpoPX = {
    { 0, 0, 0, 0, 3, 1, 1, 1, 1, 1, 3, 0, 0, 0, 0, 3 },
    { 0, 0, 0, 3, 1, 1, 1, 1, 1, 1, 1, 3, 0, 3, 3, 3 },
    { 0, 0, 0, 3, 1, 1, 3, 1, 3, 1, 1, 3, 3, 1, 1, 3 },
    { 0, 0, 0, 3, 1, 1, 3, 1, 3, 1, 1, 3, 1, 1, 3, 0 },
    { 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0 }
  };
  
  int[][] tamaOcchiNormPX = {
    { 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0 }
  };
  
  int[][] tamaOcchiFeliPX = {
    { 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 3, 0, 3, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0 }
  };
  
  int[][] tamaOcchiTrisPX = {
    { 0, 0, 0, 3, 3, 3, 0, 0, 0, 3, 3, 3, 0, 0, 0, 0 },
    { 0, 0, 0, 2, 2, 2, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0 }
  };
  
  int[][] tamaOcchiSleepPX = {
    { 0, 0, 0, 0, 3, 3, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
  };
  
  int[][] tamaOcchiDeathPX = {
    { 0, 0, 0, 3, 0, 3, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 3, 0, 3, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0 }
  };
  
  int[][] fishPX = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 3, 3, 0, 0 },
    { 3, 0, 0, 0, 3, 1, 1, 3, 0 },
    { 3, 3, 0, 3, 1, 1, 2, 1, 3 },
    { 3, 1, 3, 1, 1, 1, 1, 1, 3 },
    { 3, 3, 0, 3, 1, 1, 1, 1, 3 },
    { 3, 0, 0, 0, 3, 1, 1, 3, 0 },
    { 0, 0, 0, 0, 0, 3, 3, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 }
  };

  int[][] bonePX = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 3, 0, 0, 0, 0, 0, 3, 0 },
    { 3, 1, 3, 3, 3, 3, 3, 0, 3 },
    { 3, 1, 1, 1, 1, 1, 1, 0, 3 },
    { 0, 3, 2, 1, 1, 1, 2, 3, 0 },
    { 3, 1, 1, 1, 1, 1, 1, 0, 3 },
    { 3, 1, 3, 3, 3, 3, 3, 0, 3 },
    { 0, 3, 0, 0, 0, 0, 0, 3, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 }
  };
  
  int[][] waterPX = {
    { 0, 0, 0, 0, 3, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 3, 0, 0, 0, 0 },
    { 0, 0, 0, 3, 1, 3, 0, 0, 0 },
    { 0, 0, 0, 3, 2, 3, 0, 0, 0 },
    { 0, 0, 0, 3, 2, 3, 0, 0, 0 },
    { 0, 0, 3, 2, 2, 2, 3, 0, 0 },
    { 0, 0, 3, 2, 2, 2, 3, 0, 0 },
    { 0, 0, 3, 2, 2, 2, 3, 0, 0 },
    { 0, 0, 0, 3, 3, 3, 0, 0, 0 }
  };
  
  int[][] healthPX = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 3, 0, 0, 0, 0 },
    { 0, 0, 0, 3, 1, 3, 0, 0, 0 },
    { 0, 0, 3, 3, 3, 3, 3, 0, 0 },
    { 0, 3, 1, 1, 2, 1, 1, 3, 0 },
    { 0, 3, 1, 2, 2, 2, 1, 3, 0 },
    { 0, 3, 1, 1, 2, 1, 1, 3, 0 },
    { 0, 0, 3, 3, 3, 3, 3, 0, 0 }
  };
  
  int[][] foodPX = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 2, 2, 2, 0, 0, 0 },
    { 0, 0, 2, 2, 2, 2, 2, 0, 0 },
    { 0, 3, 2, 2, 2, 2, 2, 3, 0 },
    { 3, 1, 3, 3, 3, 3, 3, 1, 3 },
    { 3, 1, 1, 1, 1, 1, 1, 1, 3 },
    { 0, 3, 3, 3, 3, 3, 3, 3, 0 }
  };
  
  int[][] playPX = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 3, 3, 3, 0, 0, 0 },
    { 0, 0, 3, 2, 1, 1, 3, 0, 0 },
    { 0, 3, 2, 2, 1, 1, 2, 3, 0 },
    { 0, 3, 1, 1, 2, 2, 1, 3, 0 },
    { 0, 3, 1, 1, 2, 2, 1, 3, 0 },
    { 0, 1, 3, 2, 1, 1, 3, 0, 0 },
    { 0, 0, 0, 3, 3, 3, 0, 0, 0 }
  };
  
  int[][] showerPX = {
    { 0, 0, 0, 0, 3, 0, 0, 0, 0 },
    { 0, 0, 0, 3, 1, 3, 0, 0, 0 },
    { 0, 0, 3, 1, 1, 1, 3, 0, 0 },
    { 0, 3, 1, 1, 1, 1, 1, 3, 0 },
    { 0, 3, 1, 1, 1, 2, 1, 3, 0 },
    { 0, 3, 1, 1, 2, 2, 1, 3, 0 },
    { 0, 0, 3, 1, 1, 1, 3, 0, 0 },
    { 0, 0, 0, 3, 3, 3, 0, 0, 0 }
  };
  
  int[][] lightPX = {
    { 0, 0, 0, 3, 3, 3, 0, 0, 0 },
    { 0, 0, 3, 1, 1, 1, 3, 0, 0 },    
    { 0, 3, 1, 1, 1, 2, 1, 3, 0 },
    { 0, 3, 1, 1, 2, 2, 1, 3, 0 },
    { 0, 0, 3, 1, 1, 1, 3, 0, 0 },
    { 0, 0, 0, 3, 3, 3, 0, 0, 0 },
    { 0, 0, 0, 3, 1, 3, 0, 0, 0 },
    { 0, 0, 0, 0, 3, 0, 0, 0, 0 }
  };
  
  int[][] menuPX = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 3, 3, 3, 3, 3, 0, 0, 0 },
    { 3, 1, 1, 1, 1, 1, 3, 0, 0 },
    { 3, 1, 2, 2, 2, 1, 3, 0, 0 },
    { 3, 1, 1, 1, 1, 1, 3, 0, 0 },
    { 3, 1, 2, 2, 2, 1, 3, 0, 0 },
    { 3, 1, 1, 1, 1, 1, 3, 0, 0 },
    { 0, 3, 3, 3, 3, 3, 0, 0, 0 }
  };
  
  int[][] emptyPX = {
    { 3, 3, 3, 3, 3 },
    { 3, 1, 1, 1, 3 },
    { 3, 3, 3, 3, 3 }
  };
  
  int[][] lowPX = {
    { 3, 3, 3, 3, 3 },
    { 3, 2, 1, 1, 3 },
    { 3, 3, 3, 3, 3 }
  };
  
  int[][] mediumPX = {
    { 3, 3, 3, 3, 3 },
    { 3, 2, 2, 1, 3 },
    { 3, 3, 3, 3, 3 }
  };
  
  int[][] highPX = {
    { 3, 3, 3, 3, 3 },
    { 3, 2, 2, 2, 3 },
    { 3, 3, 3, 3, 3 }
  };
  
  int[][] starSmallPX = {
    {0, 3, 0},
    {3, 1, 3},
    {0, 3, 0}
  };
  
  int[][] starMediumPX = {
    {0, 0, 3, 0, 0},
    {0, 0, 3, 0, 0},
    {3, 3, 1, 3, 3},
    {0, 3, 3, 3, 0},
    {0, 3, 0, 3, 0}
  };
  
  int[][] poopPX = {
    {0, 0, 0, 0, 3, 0, 0, 0, 0},
    {0, 0, 0, 3, 1, 3, 0, 0, 0},
    {0, 0, 3, 2, 2, 2, 3, 0, 0},
    {0, 3, 1, 1, 1, 1, 1, 3, 0},
    {0, 3, 2, 2, 2, 2, 2, 3, 0},
    {3, 1, 1, 1, 1, 1, 1, 1, 3},
    {0, 3, 3, 3, 3, 3, 3, 3, 0}
  };
  
  int[][] bubblePX = {
    {0, 0, 2, 2, 0, 0},
    {0, 2, 0, 0, 2, 0},
    {2, 0, 0, 0, 0, 2},
    {2, 0, 0, 0, 0, 2},
    {0, 2, 0, 0, 2, 0},
    {0, 0, 2, 2, 0, 0}      
  };
  
  int[][] spongePX = {
    {0, 3, 3, 0, 0, 0, 3, 3, 0},
    {3, 1, 1, 3, 3, 3, 1, 1, 3},
    {3, 1, 2, 1, 1, 1, 2, 1, 3},
    {3, 1, 1, 1, 1, 1, 1, 2, 3},
    {3, 1, 1, 2, 1, 2, 1, 1, 3},
    {3, 2, 1, 1, 1, 1, 2, 1, 3},
    {3, 1, 2, 3, 3, 3, 1, 1, 3},
    {0, 3, 3, 0, 0, 0, 3, 3, 0}
  };
  
  int[][] syringePX = {
    {0, 0, 3, 3, 3, 3, 3, 0, 3},
    {3, 3, 2, 2, 2, 3, 3, 3, 3},
    {0, 0, 3, 3, 3, 3, 3, 0, 3}
  };
  
  Images() {    
    for(int i = 0; i < width/n; i++) {
      sepPX[0][i] = i % 2 == 0 ? 3 : 2;
    }    
    sep = toColor(sepPX);
    
    sfondo.beginDraw();
      sfondo.strokeWeight(1);
      sfondo.stroke(255, 10);
      sfondo.fill(BLUE);
      for ( int i = 0; i < width; i += n ) {    
        for ( int j = 0; j < height; j += n ) {    
          sfondo.rect(i, j, n, n);
        }
      }
      sfondo.image(sep, 0, n*16);
    sfondo.endDraw();

    tamaTesta = toColor(tamaTestaPX);
    tamaCorpo = toColor(tamaCorpoPX);
    tamaOcchiFeli = toColor(tamaOcchiFeliPX);
    tamaOcchiTris = toColor(tamaOcchiTrisPX);
    tamaOcchiNorm = toColor(tamaOcchiNormPX);
    tamaOcchiSleep = toColor(tamaOcchiSleepPX);
    tamaOcchiDeath = toColor(tamaOcchiDeathPX);
    
    health = toColor(healthPX);
    food = toColor(foodPX);
    play = toColor(playPX);
    shower = toColor(showerPX);
    light = toColor(lightPX);
    menu = toColor(menuPX);
    
    empty = toColor(emptyPX);
    low = toColor(lowPX);
    medium = toColor(mediumPX);
    high = toColor(highPX);
    
    starSmall = toColor(starSmallPX);
    starMedium = toColor(starMediumPX);
    
    bone = toColor(bonePX);
    fish = toColor(fishPX);
    water = toColor(waterPX);
    
    poop = toColor(poopPX);
    
    sponge = toColor(spongePX);
    bubble = toColor(bubblePX);
    
    syringe = toColor(syringePX);
  }
  
  PGraphics toColor(int[][] pxs) {
    int l = pxs[0].length;
    int a = pxs.length;
    
    PGraphics pg = createGraphics(l*n, a*n);
        
    pg.beginDraw();
    pg.noStroke();
    for ( int i = 0; i < a; i++ ) {
      for ( int j = 0; j < l; j++ ) {
        switch(pxs[i][j]) {
          case 0:
            continue;
          case 1:
            pg.fill(BLUE);
            pg.rect(n*j, n*i, n, n);
            break;
          case 2:
            pg.fill(BLUE);
            pg.rect(n*j, n*i, n, n);
            pg.fill(DARK_BLUE);
            pg.rect(n*j+1, n*i+1, n-1, n-1);
            break;
          case 3:
            pg.fill(BLUE);
            pg.rect(n*j, n*i, n, n);
            pg.fill(BLACK);
            pg.rect(n*j+1, n*i+1, n-1, n-1);
            break;
        }
        
      }
    }
    pg.endDraw();
    
    return pg;
  }
  
}