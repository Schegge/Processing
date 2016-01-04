/**
 *   Feed the Snake
 *      by clicking!
 */

public Snake snake = new Snake();
public ArrayList<Food> food = new ArrayList<Food>();

public int limit = 50; // canvas margins
public float m = 0; // millis()

void setup() {
  size(500, 500);  
  noStroke();
  frameRate(60);
  background(168,202,186);
}

void draw() {
  m = millis();
  
  drawRiver();
  
  if(food.size() < 4) {
    food.add(new Food((int)random(limit, width-limit), (int)random(limit, height-limit)));
  }
  
  for(int i = 0; i < food.size(); i++) {
    food.get(i).drawFood();
    // remove if the food gets eaten or dies
    if( food.get(i).eaten(snake) || m > food.get(i).life ) {
      food.remove(i);
      i--;
      snake.moving = false;
    }
  }
  
  snake.drawSnake();
}

void mousePressed() {
  food.add(new Food(constrain(mouseX, limit, width-limit), constrain(mouseY, limit, height-limit)));
}