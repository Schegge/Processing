public class Snake {
  public boolean moving = false;
  
  public PVector position = new PVector(0, 0);
  private PVector target = new PVector(0, 0);
  private PVector velocity = new PVector(0, 0);
  private PVector acceleration = new PVector(0, 0);
  
  static final int segLength = 13;
  private final int num = 13;
  private PVector[] xy = new PVector[num];
    
  Snake() {
    for(int i=0; i < num; i++) {
         xy[i] = new PVector(0, 0);
      }
  }
  
  public void drawSnake() {    
    move();
    
    for(int i = num-1; i > 0; i--) {
       drawPart(i, xy[i-1].x, xy[i-1].y);
    }
    drawPart(0, position.x, position.y);
  }
  
  public void drawPart(int i, float xin, float yin) {
    float dx = xin - xy[i].x;
    float dy = yin - xy[i].y;    
    float angle = atan2(dy, dx);    
    xy[i].x = xin - cos(angle) * segLength * 0.4;
    xy[i].y = yin - sin(angle) * segLength * 0.4;
    
    pushMatrix();
      translate(xy[i].x, xy[i].y);
      rotate(angle);
      pushStyle();
        rectMode(CENTER);
        if (i % 3 == 0) fill(54,84,79);
        else fill(131,152,142);
        rect(0, 0, segLength-ceil(i/2), segLength-ceil(i/2), 5);
        if(i == 0) {
          beginShape();
            vertex(0, -segLength*0.5);
            vertex(segLength*0.8, -segLength*0.6);
            vertex(segLength/2-2, 0);
            vertex(segLength*0.8, segLength*0.6);            
            vertex(0, segLength*0.5);
          endShape();
        }
      popStyle();
    popMatrix();
  }
  
  public void move() {
    if( !moving ) {
      target = new PVector( food.get(0).x, food.get(0).y );
      moving = true;
    }
    PVector dir = PVector.sub(target, position);
    dir.normalize();
    acceleration.add(dir);
    velocity.add(acceleration);
    velocity.limit(3);
    position.add(velocity);
    acceleration.mult(0);
  }
  
}
