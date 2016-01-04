class Lang {  
  String[] istructions = new String[2];
  String stats;
  String[] fine = new String[4];
  String newGame;
  
  Lang(boolean eng) {
    if (eng) {
      istructions[0] = new String("Help the alien to protect their\nplanet from asteroids!\nDestroy them using the mouse.\nDestroy ");
      istructions[1] = new String(" asteroids.\n \nClick here to start.");
      
      stats = new String("Asteroids left: ");
      
      fine[0] = new String("SCORE: ");
      fine[1] = new String("%\nDestroyed asteroids: ");
      fine[2] = new String("/");
      fine[3] = new String("\nUsed bullets: ");
      
      newGame = new String("Click to start\na new game!");
      
    } else {
      istructions[0] = new String("Aiuta l'alieno a salvare il suo\npianeta dagli asteroidi!\nDistruggili usando il mouse.\nDevi distruggere "); 
      istructions[1] = new String(" asteroidi.\n \nClicca qui per iniziare.");
      
      stats = new String("Asteroidi rimasti: ");
      
      fine[0] = new String("PUNTEGGIO: ");
      fine[1] = new String("%\nAsteroidi distrutti: ");
      fine[2] = new String("/");
      fine[3] = new String("\nColpi usati: ");
      
      newGame = new String("Clicca per\ngiocare di nuovo!");
    }    
  }
  
}
