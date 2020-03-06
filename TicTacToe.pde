// 3*3 Spielfeld
private Field[][] fields;
private int currentPlayer;
private int length = 200;
private Button btnReset;
private Button VorschauToggle;


//TODO Siege mitzählen
//Erweiterungen:
//Scoreboard
//vorschau
// 


void setup(){
  size(600,700);
  background(0,54,141);
  fields = new Field[3][3]; //init zweidimiensinales Array (0,0) bis (2,2)
  //mit leeren Zellen befüllen
  resetGame();
  btnReset = new Button("Reset Game", new ResetActionListener(this));
  VorschauToggle = new Button("An",new VorschauActionListener(this));
  btnReset.setBounds(0,600,600,100);
  VorschauToggle.setBounds(600,100,199,100);
  
  
  
  }

void draw(){
  
  for (int i = 0; i < 3; i++){
    for (int l = 0; l < 3; l++){
      //Field f = fields[i][l];
      //f.draw();
      fields[i][l].draw();
      }
    }
    btnReset.draw();
    VorschauToggle.draw();
    
  }
  void mousePressed(){
  for (int i = 0; i < 3; i++){
    for (int l = 0; l < 3; l++){
      //Field f = fields[i][l];
      //f.draw();
      fields[i][l].mousePressed();
      }
    }
    btnReset.mousePressed();
    VorschauToggle.mousePressed();
  }
  void mouseReleased(){
    if(getWinner() == -1){
  for (int i = 0; i < 3; i++){
    for (int l = 0; l < 3; l++){
      //Field f = fields[i][l];
      //f.draw();
       if (fields[i][l].mouseReleased()){
        if (currentPlayer == 0){
         fields[i][l] = new CircleField(i * length, l * length, length , length);
        }else{
          fields[i][l] = new CrossField( i * length , l * length, length, length);
        }
       
        if (getWinner() == 2){
          //es gibt ein Unentschieden
          System.out.println("Partie endet mit einem Unentschieden");
        } else if (getWinner()!= -1){
          //es gibt einen Gewinner
          System.out.println("Sieger ist "+ ((getWinner() == 0)?"Kreis": "Kreuz" ));
          
        
        //if(getWinner()!= -1 && getWinner()!= 0 && getWinner()!= 1 ){
          
        //}
        }
       
        currentPlayer = (currentPlayer + 1) % 2; //wechselt von 0 auf 1 bzw. von 1 auf 0
          
        }
      }
    }
   }
   btnReset.mouseReleased();
   VorschauToggle.mouseReleased();
  }
  
  /**
  HA:
  -1: Spiel läuft
  0 Kreis gewinnt
  1 Kreuz gewinnt
  2 Unentschieden
  **/
  int getWinner(){
    //int type = 0;    // 0: Kreis, 1: Kreuz
    for (int type = 0; type < 2; type++){
    for (int i = 0;i <3; i++){
      
      //Idee: Wähle eine feste Zeile i aus un prüfe , ob die Kästchen gleich sind
      
      if (fields[0][i].getType() == type && fields[1][i].getType() == type && fields[2][i].getType() == type){
        fields[0][i].setMarked();
        fields[1][i].setMarked();
        fields[2][i].setMarked();
        return type;
       
      }
      //Idee: Wähle eine feste Spalte i aus und prüfe, ob die Kästchen gleich sind
       if (fields[i][0].getType() == type && fields[i][1].getType() == type && fields[i][2].getType() == type){
         fields[i][0].setMarked();
         fields[i][1].setMarked();
         fields[i][2].setMarked();
        return type;
       }
    }
    //diagonal links oben - rechts unten
    if (fields[0][0].getType() == type && fields[1][1].getType() == type && fields[2][2].getType() == type){
      fields[1][1].setMarked();
      fields[2][2].setMarked();
      fields[0][0].setMarked();
        return type;
       }
       //diagonal links oben - rechts unten
       if (fields[0][2].getType() == type && fields[1][1].getType() == type && fields[2][0].getType() == type){
         fields[0][2].setMarked();
         fields[1][1].setMarked();
         fields[2][0].setMarked();
        return type;
       }
    }
    //Unentschieden oder Spiel läuft
    for (int i = 0; i < 3; i++){
      for (int l = 0; l < 3; l++){
        //falls ein leeres Feld existiert --> Spiel läuft noch
        if (fields[i][l].getType() == -1){
          return -1;
        }
      }
    }
      return 2;
    
  }
  
  public void resetGame(){
    for (int i = 0; i < 3; i++){
    for (int l = 0; l < 3; l++){
    fields[i][l] = new EmptyField(i * length, l * length, length, length);
    System.out.println(length);
      }
    }
  }
