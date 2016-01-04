// convert "pixels" to image
PGraphics toColor(String[] pxs, int s) {
  int l = pxs[0].length();
  int a = pxs.length;
  
  PGraphics pg = createGraphics(l*s, a*s);      
      
  pg.beginDraw();     
  pg.noStroke();
  pg.background(200, 0);
  
  for ( int i = 0; i < a; i++ ) {
    for ( int j = 0; j < l; j++ ) {
      String current = pxs[i].substring(j,j+1);
      
      if ( current.equals(".") ) pg.fill(255, 255, 255, 120); // white glow
      else if ( current.equals("o") ) pg.fill(#76B0B7); // light blue
      else if ( current.equals("+") ) pg.fill(#56B46F); // light green
      else if ( current.equals("u") ) pg.fill(#707281); // grey
      else if ( current.equals("z") ) pg.fill(#EAC2CA); // light pink      
      else if ( current.equals("s") ) pg.fill(#E0DB76); // yellow
      else if ( current.equals("m") ) pg.fill(#6F685C); // dark grey/brown      
      else if ( current.equals("n") ) pg.fill(165, 139, 90, 200); // dark grey/brown
      else if ( current.equals("b") ) pg.fill(136, 102, 97, 150); // light grey/red
      else if ( current.equals("c") ) pg.fill(#AF9C95); // lighter grey/red   
      else if ( current.equals(",") ) pg.fill(198, 92, 92, 200); // red glow
      else pg.noFill();
      
      pg.rect(s*j, s*i, s, s);
    }
  }
  
  pg.endDraw();
   
  return pg;  
}