public class EmptyField extends Field{
  
  public EmptyField(int x, int y, int w, int h){
    super(x,y,w,h);
  
  }
  
  public void draw(){
    strokeWeight(2);
    stroke(0);
    fill(255);
    rect(x,y,w,h);
    if(isInBounds() && getWinner() == -1){
      if (currentPlayer == 0){
      stroke(180,180,255);
   strokeWeight(5);
   noFill();
   
   ellipse(x+w/2, y+h/2, 2*w/3,2*h/3);
   
    }else{
    strokeWeight(5);
 stroke(255,180,180);
 line(x+w/4, y+h/4, x+3*w/4, y+3*h/4); //links oben, rechts unten
 line(x+3*w/4, y+h/4, x+w/4, y+3*h/4); //rechts oben, links unten
    }
    }
    
  }
  
  private boolean isInBounds(){
    //linker Rand; rechter Rand; oberer Rand; unterer Rand
  return (x <= mouseX && x+w >= mouseX && y <= mouseY && y+h >= mouseY);
  
  }

  public int getType(){
    return -1;
  }
}
 