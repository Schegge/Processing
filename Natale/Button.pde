class Button {
  float x;
  float y;
  String txt;
  
  Button(float x, float y, String txt) {
    this.x = x;
    this.y = y;
    this.txt = txt;
  }
  
  void drawButton(String str) {
    pushStyle();
    fill(0, 20);
    ellipse(x, y, 100, 100);
    
    textSize(12);
    textLeading(15);
    fill(255);
    text(txt + str, x, y);
    popStyle();
  }  
}
