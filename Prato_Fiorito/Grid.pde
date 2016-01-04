class Grid {  
  int n;
  int n_total;
  int bombs;
  int size = 20;
  int margin = size*3;
  
  ArrayList<Cell> cells = new ArrayList<Cell>();
  
  boolean lose = false;
  boolean win = false;
  
  Grid(int n, int bombs) {
    this.n = n;
    this.bombs = bombs;
    
    n_total = n*n;
    
    // randomly choose the positions of the bombs
    LinkedList<Boolean> bb = new LinkedList<Boolean>();    
    for (int i = 0; i < n_total; i++) bb.add(i < bombs ? true : false);
    Collections.shuffle(bb);
    
    // create cells
    for (int i = 0; i < n_total; i++) {
      cells.add(new Cell(i%n, floor(i/n), i, bb.get(i)));
    }
    
    // determine 'value' of cells
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
      win = true;
    }
    
    fill(TEXTS);    
    if (lose) {
      text("LOST :(", width/2, margin/2);
    } else if (win) {
      text("WON :P", width/2, margin/2);
    } else {
      text("FLAGS: " + n_flag + "/" + bombs, width/2, margin/2);      
    }
  }
      
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


  class Cell {    
    int x;
    int y;
    
    int[] id = new int[3];
    int value = 0;
    char type = H;
    boolean bomb;
    
    // nearby cells
    int[] vicini = new int[8];
    
    Cell(int i, int j, int t, boolean bomb) {      
      id[0] = i;
      id[1] = j;
      id[2] = t;
      this.bomb = bomb;
      
      x = margin + id[0]*size;
      y = margin + id[1]*size;
      
      // TO CHANGE?
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
        
        if (type == O) {
          if (value > 0) {
            fill(0);
            text(value, size/2 + x, size/2 + y);
          } else if (bomb) {
            fill(BOMB);
            text('B', size/2 + x, size/2 + y);            
          }
        } else if (type == F && !lose) {
            fill(FLAG);
            text('F', size/2 + x, size/2 + y);
        }
          
        if (lose && type != O) {
          if (value > 0) {
            fill(0);
            text(value, size/2 + x, size/2 + y); 
          } else if (bomb) {
            fill(BOMB);
            text('B', size/2 + x, size/2 + y);            
          }
        }
      popStyle();
    }
    
    boolean isUnderMouse() {
      if (mouseX > x && mouseX < x + size && mouseY > y && mouseY < y + size) {
        return true;
      }
      return false;      
    }  
    
  } // fine class Cell
  
}