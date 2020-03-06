public abstract class Field{
  protected int x, y, w, h;
  private boolean pressed = false;
  
  //protected color colorBackground;
  protected boolean isMarked;
  
  public Field(int x, int y, int w, int h){
    this.x = x;  //this.x ist von "private int x" , x ist ein Übergabeparameter
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  //abstrakte Methoden
  abstract void draw();
  abstract int getType();//-1 leer, 0 = Kreis , 1 = Kreuz
  
  public void mousePressed(){
  if (isInBounds()){
    pressed = true;
  }
 
}
  //@return ob Feld einen Klick registriert hat
  public boolean mouseReleased(){
  if (isInBounds() && pressed){
  pressed = false;
  return true;
     }else{
  pressed = false;
  return false;
     }
   }

  private boolean isInBounds(){
    //linker Rand; rechter Rand; oberer Rand; unterer Rand
  return (x <= mouseX && x+w >= mouseX && y <= mouseY && y+h >= mouseY);
  
  }
  public void setMarked(){
   isMarked = true;
   
  }
    
}