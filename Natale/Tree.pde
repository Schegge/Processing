class Tree {
  PVector pos;
  float scaling;
  
  Tree(PVector pos) {
    this.pos = pos;
    scaling = map(pos.y, height/3, height, 0, 1);
  }
  
  void drawTree() {
    pushMatrix();
      translate(pos.x, pos.y);
      scale(scaling);
        image(images.treePG, 0, 0);
    popMatrix();
  }  
}
