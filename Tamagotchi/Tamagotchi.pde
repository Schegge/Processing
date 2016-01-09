/**
 * TAMAGOTCHI
 * @author Sara Zeni
 * @version 1.0
 */

 /* button[i] / game.scene:
  *   -2 : death
  *   -1 : home
  *    0 : food
  *    1 : wash
  *    2 : medicine
  *    3 : fun
  *    4 : sleep
  *    5 : menu
  */
 
int n = 3; // size of the 'pixels'
int txtSize = 22;
PFont myFont;

color BLACK = color(0);
color BLUE = color(60, 162, 162);
color DARK_BLUE = color(33, 90, 109);

Game game;
Tama tama;
Images images;

ButtonPG[] button = new ButtonPG[6];
Food[] food = new Food[3];
Wash wash;
Fun fun;
Medicine medicine;
ButtonTXT[] option = new ButtonTXT[2];


void setup() {
  size(288, 408);
  frameRate(60);
  noStroke();
  myFont = loadFont("Zado_Semi-Condensed-24.vlw");
  textFont(myFont);
  textSize(txtSize);
  textLeading(txtSize);
  textAlign(CENTER, CENTER);
  
  images = new Images();
  game = new Game();
  tama = new Tama();
  
  button[0] = new ButtonPG(0, images.food);
  button[1] = new ButtonPG(1, images.shower);
  button[2] = new ButtonPG(2, images.health);
  button[3] = new ButtonPG(3, images.play);
  button[4] = new ButtonPG(4, images.light);
  button[5] = new ButtonPG(5, images.menu);
  
  option[0] = new ButtonTXT(width/2, tama.h*2, "SALVA");
  option[1] = new ButtonTXT(width/2, tama.h*4, "NUOVO GIOCO");
  
  food[0] = new Food(button[0].x, 10, images.water);
  food[1] = new Food(button[1].x, 20, images.bone);
  food[2] = new Food(button[2].x, 30, images.fish);
}


void draw() {
  game.decrease();
  
  image(images.sfondo, 0, 0);
  
  game.info();
  
  button[0].display(game.hungry);
  button[1].display(game.clean);
  button[2].display(game.health);
  button[3].display(game.happy);
  button[4].display(game.sleep);
  button[5].display();
  
  game.mouseOver();
  
  tama.display();
  
  switch(game.scene) {
    case -2:
      game.death();
      break;

    case -1:
      // home
      break;
      
    case 0:
      game.food();
      break;
      
    case 1:
      game.clean();
      break;
      
    case 2:
      game.health();
      break;
      
    case 3:
      game.play();
      break;
      
    case 4:
      game.night();
      break;
      
    case 5:
      if (game.night) game.night();
      game.menu();
      break;
  }
}


void mousePressed() {  
  if (!game.death) {
    if (tama.isUnderMouse()) {
      if (game.night) {
        game.night = false;
        game.scene = -1;
      }
      if (game.happy < 100) game.happy++;
    }
    
    // NOT SURE ?
    for (int i = 0; i < 6; i++) {
      if (button[i].isUnderMouse()) {
        
        // change scene
        if (i == 5 && game.night) { // menu
          game.scene = game.scene == i ? 4 : i;
          break;        
        }
        
        if (i != 4 && game.night) game.night = false;      
        if (game.playing) game.playing = false;  
  
        if (i == 4) {
          game.night = !game.night;
          game.scene = game.night ? i : -1;
        } else {
          game.scene = game.scene == i ? -1 : i;
        }
        
        // specific actions
        if (i == 1) {
          wash = new Wash();
        } else if (i == 2) {
          medicine = new Medicine();
        } else if (i == 3) {        
          fun = new Fun();
          game.playing = true;
        }
        
        break;
        
      }
    }
  }
  
  // clicking on things in a scene
  switch(game.scene) {
    case -2:
      if (option[1].isUnderMouse()) {
        game.reset();
        game = new Game();
      }    
      break;
      
    case 0:
      for (int i = 0; i < 3; i++) {
        if (food[i].isUnderMouse()) {
          boolean already = false;
          for (int j = 0; j < 3; j++) {
            if(food[j].eating) {
              already = true;
            }
          }
          if(!already) food[i].grab = true;
        }
      }
      break;
      
    case 5:
      if (option[0].isUnderMouse()) {
        game.save();
      } else if (option[1].isUnderMouse()) {
        game.reset();
        game = new Game();
      }
      break;
      
    default:
      // do nothing
      break;
  }
  
  println("Night: " + game.night);
  println("Scene: " + game.scene);
  println("Playing: " + game.playing);
}


void keyTyped() {
  if (game.scene == 5) {
    // to change the tamagotchi name
    
    if (key == BACKSPACE && game._name.length() > 0) {
      game._name = game._name.substring(0, game._name.length()-1);
      
    } else if ( game._name.length() < 10 &&
              ((key >= '\u0041' && key <= '\u005A') || (key >= '\u0061' && key <= '\u007A')) ) {
      game._name += key;
    }
  }
}