public class Food {
  public int x;
  public int y;
  public float life;
  private float rand;
  private color colour;
  private float rot;
  
  Food(int x, int y) {
    this.x = x;
    this.y = y;
    life = m + random(10000, 20000); // lifespan of 10-20 seconds
    rand = random(0, 1);
    if (rand < 0.5) colour = color(237,229,116);
    else colour = color(252,145,58);
    rot = random(0, 2*PI);
  }
  
  public void drawFood() {
    pushMatrix();
      translate(x, y);
      rotate(rot);
      scale(0.7);
      fill(0, 0, 0, 30);
      beginShape();
        vertex(-13, 4);
        vertex(13, -7);
        vertex(5, 4);
        vertex(11, 8);
        vertex(-7, 8);
        vertex(-12, 5);
      endShape();
      fill(colour);
      beginShape();
        vertex(-9, 0);
        vertex(9, -4);
        vertex(2, 0);
        vertex(7, 5);
        vertex(-4, 4);
        vertex(-9, 0);
      endShape();
    popMatrix();
  }
  
  public boolean eaten(Snake snake) {
    if( abs(x - snake.position.x) <  Snake.segLength*0.6
     && abs(y - snake.position.y) <  Snake.segLength*0.6 ) {
      return true;
    } else {
      return false;
    }
  }
  
}
