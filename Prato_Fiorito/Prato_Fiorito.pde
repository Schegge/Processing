import java.util.LinkedList;
import java.util.Collections;

/**
 * ? PRATO FIORITO == MINESWEEPER
 */

int N_DEFAULT = 12;
int B_DEFAULT = 15;
 
color BACK  = color(223, 234, 228);
color GRID  = color(205, 150, 145);
color BOMB  = color(186,  74, 110);
color FLAG  = color( 12, 171, 171);
color TEXTS = color(112,  59, 105);

// cell.type
char H = 'h';
char O = 'o';
char F = 'f';

int scene = 0;
int txtSize;

Grid grid = new Grid(N_DEFAULT, B_DEFAULT);
ChooseGrid chooseG;
NewGame newGame;

void settings() {
 size(grid.ww, grid.hh);
}

void setup() {
  surface.setResizable(true);
//  size(360, 390);

  frameRate(60);

  txtSize = floor(grid.size*0.6);
  textFont(createFont("Arial", txtSize));
  textAlign(CENTER, CENTER);
  stroke(BOMB);
  
  chooseG = new ChooseGrid();
  newGame = new NewGame();
}

void draw() {
  background(BACK);
  switch(scene) {
    case 0:
      chooseG.display();
      break;
    
    case 1:
      grid.display();
      break;
  }
    
  newGame.display();
}

void mousePressed() {
  switch(scene) {
    case 0:
      chooseG.mousePress();
      break;
    
    case 1:
      grid.mousePress();
      break;
  }
    
  newGame.clicked();
}

void keyTyped() {
  if (scene == 0) chooseG.whenKeyTyp();
}

/*
 *
 *
 */
 
 