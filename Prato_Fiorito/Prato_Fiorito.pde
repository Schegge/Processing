import java.util.Collections;
import java.util.LinkedList;

/**
 * ? PRATO FIORITO == MINES
 */
 
/*
 * @TODO: option to change grid size and num of bombs
 */


int N_DEFAULT = 12;
int B_DEFAULT = 15;

 
color BACK = color(223,234,228);
color GRID = color(205,150,145);
color BOMB = color(186,74,110);
color FLAG = color(12,171,171);
color TEXTS = color(112,59,105);

// cell.type
char H = 'h';
char O = 'o';
char F = 'f';

Grid grid = new Grid(N_DEFAULT, B_DEFAULT);
NewGame newGame;


void settings() {
  int s = grid.n*grid.size + grid.margin*2;
  size(s, s+grid.margin/2);
}

void setup() {
  surface.setResizable(true);
  
  textSize(floor(grid.size*0.6));
  textAlign(CENTER, CENTER);
  stroke(BOMB);
  
  newGame = new NewGame();
}


void draw() {  
  background(BACK);
  
  grid.display();
  
  newGame.display();
}

void mousePressed() {
  if (!grid.win && !grid.lose) {
    
    for (int i = 0; i < grid.n_total; i++) {
      if (grid.cells.get(i).isUnderMouse()) {
        
        if (grid.cells.get(i).type == H) {
          
          if (mouseButton == LEFT) {
            grid.cells.get(i).type = O;
            if (grid.cells.get(i).value == 0) {
              // check all adjacent empty cells
              grid.checkEmpties(i);
              
            }
            if (grid.cells.get(i).bomb) {
              grid.lose = true;
            }            
          } else if (mouseButton == RIGHT) {
            grid.cells.get(i).type = F;
          }
          
        } else if (grid.cells.get(i).type == F && mouseButton == LEFT) {
          grid.cells.get(i).type = H;
        }
        break;
        
      }
    }
    
  }  
}