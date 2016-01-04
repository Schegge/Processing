class Texts {
  float x;
  float y;
  String txt;

  Texts(String _txt) {    
    x = ww / 2;
    y = hh - 20;
    txt = _txt;
  }

  void drawing() {
    pushStyle();
    textSize(16);
    textLeading(16);
    fill(0, 0, 0, 90);
    text(txt, x + 2, y + 2);
    fill(255);
    text(txt, x, y);
    popStyle();
  }
}