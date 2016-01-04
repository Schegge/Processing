class Game {
  JSONObject json;
  JSONObject save;
  
  int scene = -1;
  
  float ver;
  
  String name;
  String _name;
  int birth;
  int lastAccessDay;
  int lastAccessMinutes;
  int hungry;
  int clean;
  int health;
  int sleep;
  int happy;
  int lvl;
  boolean night;
  boolean poop;
  
  int life;
  int today;
  int diffAccess;
  boolean death;
  
  boolean playing = false;
  
  Game() {
    json = loadJSONObject("data.json");
    
    // version of game's update
    ver = json.getFloat("ver"); // YET TO USE
    
    // julian day number
    int a = floor((14 - month())/12);
    int y = year() + 4800 - a;
    int m = month() + 12*a - 3;    
    today = day() + floor((153*m+2)/5) + 365*y + floor(y/4) - floor(y/100) + floor(y/400) - 32045;
    
    // tama's info
    name = json.getString("name");
    _name = json.getString("name");
    birth = json.getInt("birth") == 0 ? today : json.getInt("birth");
    life = today - birth;
    
    // calculate last access
    if ( json.getInt("lastAccessDay") == 0 ) { // playing for the first time
      lastAccessDay = today;
      lastAccessMinutes = hour()*60+minute();
    } else {
      lastAccessDay = json.getInt("lastAccessDay");
      lastAccessMinutes = json.getInt("lastAccessMinutes");      
    }
    
    diffAccess = (today - lastAccessDay)*1440 + (hour()*60+minute() - lastAccessMinutes);
    int decr = round( map(diffAccess, 0, 1440, 0, 60) );
    
    lastAccessDay = today;
    lastAccessMinutes = hour()*60+minute();
    
    // game variables
    night = json.getBoolean("night");
    if ( night ) {
      sleep = diffAccess > 0 ? 100 : json.getInt("sleep") + (100-json.getInt("sleep"))/2;
      scene = 4;
    } else {
      sleep = json.getInt("sleep") > decr ? json.getInt("sleep") - decr : 0;
    }
    
    hungry = json.getInt("hungry") - decr > 0 ? json.getInt("hungry") - decr : 0;
    clean = json.getInt("clean") > decr ? json.getInt("clean") - decr : 0;
    poop = diffAccess > 1440/2 ? true : json.getBoolean("poop");
    health = json.getInt("health") > decr/3 ? json.getInt("health") - decr/3 : 0;
    happy = json.getInt("happy") > decr ? json.getInt("happy") - decr : 0;    
    lvl = json.getInt("lvl");
    
    // end of game 'cause of death
    death = !death && diffAccess > 1440*5 ? true : json.getBoolean("death");
    if (death) {
      scene = -1;
      night = false;
      poop = false;
    }
  
    
    println(
      name + " | " + today + " " + birth + " " + life + " | " + diffAccess + " " + decr + " | " +
      hungry + " " + clean + " " + health + " " + happy + " " + sleep + " | " + lvl + " | " + death
    );
  }
  
  void decrease() {
    if ( frameCount % 3600 == 0 ) {
      if(hungry > 0) hungry--;
      if(sleep > 0 && !night) sleep--;
      if(clean > 0) clean--;
      if(happy > 0 && !playing) happy--;
      
      println(hungry + " " + clean + " " + health + " " + happy + " " + sleep);
    }    
  }
  
  void death() {
    pushStyle();
    fill(BLACK);
    text(name + " e' morto!", width/2, tama.h*3); 
    popStyle();
    option[1].display();
  }
  
  void food() {
    for (int i = 0; i < 3; i++ ) {
      food[i].display();
    }
  }
  
  void clean() {
    if ( tama.isUnderMouse()
      && frameCount % 5 == 0 ) {
      if ( clean < 100 ) {
        clean++;
      } else {
        game.poop = false;
        game.scene = -1;
      }
    }
    wash.display();
  }
  
  void health() {
    medicine.display();
  }
  
  void play() {
    if ( frameCount % 30 == 0
      && happy < 100 ) {
      happy++;
    }
    fun.funGame();    
  }
  
  void night() {
    if ( frameCount % 300 == 0
      && sleep < 100 ) {
      sleep++;
    }
    pushStyle();
    fill(BLACK, 100);
    rect(0, tama.h, width, height);
    popStyle();
  }
  
  void menu() {
    option[0].display();
    pushStyle();
    fill(BLACK);
    text("Cambia nome\n" + _name, width/2, tama.h*3); 
    popStyle();
    option[1].display();
  }
  
  void info() { 
    pushStyle();
    fill(BLACK);
    text(game.name + " (" + game.life + "G)",
      width/2, tama.h*7 + tama.h/2
    );
    popStyle();
  }

  void save() {
    save = new JSONObject();
    
    name = _name;
    save.setString("name", name);
    save.setInt("birth", birth);
    save.setInt("lastAccessDay", lastAccessDay);
    save.setInt("lastAccessMinutes", lastAccessMinutes);
    save.setBoolean("night", night);
    save.setInt("hungry", hungry);
    save.setInt("sleep", sleep);
    save.setInt("health", health);
    save.setInt("clean", clean);
    save.setInt("happy", happy);
    save.setInt("lvl", lvl);
    save.setBoolean("poop", poop);
    save.setBoolean("death", death);
    save.setFloat("ver", ver);
    
    saveJSONObject(save, "data/data.json");
  }
  
  void reset() {
    save = new JSONObject();
    
    save.setString("name", "Luna");
    save.setInt("birth", today);
    save.setInt("lastAccessDay", today);
    save.setInt("lastAccessMinutes", hour()*60+minute());
    save.setBoolean("night", false);
    save.setInt("hungry", 100);
    save.setInt("sleep", 100);
    save.setInt("health", 100);
    save.setInt("clean", 100);
    save.setInt("happy", 100);
    save.setInt("lvl", 1);
    save.setBoolean("poop", false);
    save.setBoolean("death", false);
    save.setFloat("ver", ver);
    
    saveJSONObject(save, "data/data.json");
  }
  
  void mouseOver() {
    boolean maus = false;
    
    if ( !death && game.buttonsAreUnderMouse() ) {
      maus = true;
    } else {
      switch(scene) {
        case 5:
          if (option[0].isUnderMouse()) maus = true;
        case -2:
          if (option[1].isUnderMouse()) maus = true;
          break;
          
        case 0:
          if ( food[0].isUnderMouse() || food[1].isUnderMouse() || food[2].isUnderMouse() ) {
            maus = true;
          }
          break;
      }
    }
    
    if ( maus ) cursor(HAND);
    else cursor(ARROW);
  }
  
  boolean buttonsAreUnderMouse() {
    if (      tama.isUnderMouse() ||
         button[0].isUnderMouse() ||
         button[1].isUnderMouse() ||
         button[2].isUnderMouse() ||
         button[3].isUnderMouse() ||
         button[4].isUnderMouse() ||
         button[5].isUnderMouse() ) {
        return true;
      }
      return false;
  }
  
}