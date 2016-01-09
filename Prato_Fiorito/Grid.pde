class Grid {  
  int ww, hh;
  
  int n;
  int n_total;
  int bombs;
  int size = 20;
  int margin = size*3;  
  boolean lost;
  boolean won;
  
  int firstCellPressed = -1;
  
  ArrayList<Cell> cells = new ArrayList<Cell>();
  
  Grid(int n, int bombs) {
    init(n, bombs);
  }
  
  /*
   * initialization of the game's grid
   */
  void init(int n, int bombs) {
    firstCellPressed = -1;
    
    lost = false;
    won = false;
  
    this.n = n;
    this.bombs = bombs;    
    n_total = n*n;
    
    ww = n*size + margin*2;
    hh = n*size + margin*3;
    
    // reset and create cells
    cells.clear();
    for (int i = 0; i < n_total; i++) {
      cells.add(new Cell(i%n, floor(i/n), i));
    }   
  }
  /*
   * 
   */  
  void firstClick(int first) {
    firstCellPressed = first;
    
    // exclude cell's index clicked and neighbours
    ArrayList<Integer> ix = new ArrayList<Integer>();
    ix.add(first);
    for (int z = 0; z < 8; z++) {
      if (cells.get(first).vicini[z] > -1 ) {
        ix.add(cells.get(first).vicini[z]);
      }
    }
    Collections.sort(ix);
    
    // randomly choose the positions of the bombs    
    LinkedList<Boolean> bbs = new LinkedList<Boolean>();
    for (int i = 0; i < n_total - ix.size(); i++) {
      bbs.add(i < bombs ? true : false);
    }
    Collections.shuffle(bbs);    
    // add cells' indexes excluded before
    for (int i = ix.size() - 1; i >= 0; i--) {
      bbs.add(ix.get(i) - i, false);
    }
    
    // set bombs
    for (int i = 0; i < n_total; i++) {
      cells.get(i).bomb = bbs.get(i);
    }
    
    // determine value of cells
    for (int i = 0; i < n_total; i++) {
      if (cells.get(i).bomb) {
        cells.get(i).value = -1;
        continue;
      }
      for (int z = 0; z < 8; z++) {
        if (cells.get(i).vicini[z] > -1 && cells.get(cells.get(i).vicini[z]).bomb ) {
          cells.get(i).value++;
        }
      }
    }
    
  }
  /*
   * 
   */
  void display() {
    int n_revealed = 0;
    int n_flag = 0;
    
    for (int i = 0; i < n_total; i++) {
      cells.get(i).display();
      if (cells.get(i).type== O && !cells.get(i).bomb) {
        n_revealed++;
      } else if (cells.get(i).type == F) {
        n_flag++;
      }
    }
    
    if (n_revealed == n_total - bombs) {
      won = true;
    }
    
    fill(TEXTS);    
    if (lost) {
      text("LOST :(", ww/2, margin/2);
    } else if (won) {
      text("WON :P", ww/2, margin/2);
    } else {
      text("FLAGS: " + n_flag + "/" + bombs, ww/2, margin/2);      
    }
  }
  /*
   * 
   */
  void mousePress() {    
    if (!won && !lost) {
     
      for (int i = 0; i < n_total; i++) {
        if (cells.get(i).isUnderMouse()) {
          
          if (firstCellPressed < 0) firstClick(i);
          
          if (cells.get(i).type == H) {            
            if (mouseButton == LEFT) {
              cells.get(i).type = O;
              if (cells.get(i).value == 0) {
                // check all adjacent empty cells
                checkEmpties(i);              
              } else if (cells.get(i).bomb) {
                lost = true;
              }            
            } else if (mouseButton == RIGHT) {
              cells.get(i).type = F;
            }            
          } else if (cells.get(i).type == F && mouseButton == LEFT) {
            cells.get(i).type = H;
          }
          
          break;          
        }
      }

    }
  }
  /*
   * 
   */
  void checkEmpties(int ii) {
    for (int i = 0; i < 8; i++) {
      if ( cells.get(ii).vicini[i] > -1 &&
           cells.get(cells.get(ii).vicini[i]).type == H ) {
            
        cells.get(cells.get(ii).vicini[i]).type = O;
        
        if (cells.get(cells.get(ii).vicini[i]).value == 0) {
          checkEmpties(cells.get(ii).vicini[i]);
        }
      }
    }
  }
  /*
   * 
   */
  // for processing.js
  //void ShuffleArray(boolean[] array) {
  //  int index;
  //  boolean temp;
  //  for (int i = array.length - 1; i > 0; i--) {
  //    index = floor(random(i+1));
  //    temp = array[index];
  //    array[index] = array[i];
  //    array[i] = temp;
  //  }
  //}
  
  
  /*
   * INFO EACH SQUARE
   */
  class Cell {    
    int x;
    int y;
    
    int[] id = new int[3];
    int value = 0;
    char type = H;
    boolean bomb = false;
    
    // nearby cells
    int[] vicini = new int[8];
    
    Cell(int i, int j, int t) {      
      id[0] = i;
      id[1] = j;
      id[2] = t;
      
      x = margin + id[0]*size;
      y = margin + id[1]*size;
      
      // TO CHANGE? a better way?
      vicini[0] = id[1] - 1 >= 0                   ? t - n     : -1;
      vicini[1] = id[1] + 1 <  n                   ? t + n     : -1;
      vicini[2] = id[0] - 1 >= 0                   ? t - 1     : -1;
      vicini[3] = id[0] + 1 <  n                   ? t + 1     : -1;
      vicini[4] = id[1] - 1 >= 0 && id[0] - 1 >= 0 ? t - n - 1 : -1;
      vicini[5] = id[1] - 1 >= 0 && id[0] + 1 <  n ? t - n + 1 : -1;
      vicini[6] = id[1] + 1 <  n && id[0] - 1 >= 0 ? t + n - 1 : -1;
      vicini[7] = id[1] + 1 <  n && id[0] + 1 <  n ? t + n + 1 : -1;
    }
    
    void display() {
      pushStyle();      
        if (type == H) fill(GRID);
        else if (type == F) fill(GRID, 100);
        else fill(BACK);
        rect(x, y, size, size);
        
        if (type == O || lost) {
          if (value > 0) {
            fill(0);
            text(value, size/2 + x, size/2 + y);
          } else if (bomb) {
            fill(BOMB);
            text('B', size/2 + x, size/2 + y);            
          }
          
        } else if (type == F || won && bomb) {
            if (type == H) type = F;
            fill(FLAG);
            text('F', size/2 + x, size/2 + y);
        }
      popStyle();
    }
    
    boolean isUnderMouse() {
      if (mouseX > x && mouseX < x + size && mouseY > y && mouseY < y + size) {
        return true;
      }
      return false;      
    }
  }
  
}