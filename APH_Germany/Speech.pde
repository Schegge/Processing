class Speech {
  
  float x = width/4;
  float y = height/2.4;
  
  float w = 100;
  float h = 65;
  
  float[][] points = {
    {  0   , -1   },
    { -0.9 , -1   },
    { -1   , -0.9 },
    { -1   ,  0.9 },
    { -0.9 , 1    },
    {  0   , 1    }
  };
  
  void drawing() {
    pushMatrix();
    translate(x, y);
    
    fill(#C9DDE3);
    beginShape();
      for ( int i = 0; i < points.length; i++ ) {
        vertex(w*points[i][0], h*points[i][1]); 
      }
      for ( int i = points.length-1; i >= 0; i-- ) {
        vertex(-w*points[i][0], h*points[i][1]); 
      }
    endShape();
    beginShape();    
      vertex(w*1.2, h*0.4);
      vertex(w*0.9, h*0.4);
      vertex(w*0.9, h*0.7);
    endShape();         
    
    fill(#62A7BF);
    text(
      "ITALIEN!\n" +
      "I can't believe you!\n" +
      "Flirting when\n" +
      "you've got me!\n" +    
      "HEIRATE MICH!",
      0, -2
    );
    
    popMatrix();
  }
  
}