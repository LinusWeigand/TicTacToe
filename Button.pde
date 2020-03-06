public class Button{
  private String text;
  private int x, y, w, h;//Dimension des Buttons
  private color lightblue, darkblue, black, white;
  
  private boolean pressed = false;
  
  private ActionListener action;
  
  public Button(String t){
    text = t;
    darkblue = color(0, 120, 255);
    lightblue = color (0,151,255);
    black = color (0,0,0);
    white = color(255,255,255);
    action = new ActionListenerA();//(überflüssig)
    
    
  }
  public Button(String text,ActionListener action){
    this(text); //verwende anderen existierenden Kunstruktor
    this.action = action; //setze neuen ActionListener
  }
    
    
  public void setBounds(int x,int y, int w,int h){
this.x = x;
this.y = y;
this.w = w;
this.h = h;
  
  }
  public void draw(){
    stroke(0,0,0);
    strokeWeight(2);
   if (isInBounds() && pressed ){
     fill(darkblue);
   } else{
     fill (lightblue);}
     if(!isInBounds() && pressed){
         fill(darkblue);
       }
     rect(x ,y, w, h);
     if (isInBounds()){
  
     fill(white);
     }else {
       fill (black);
     } 
     if(!isInBounds() && pressed){
         fill(white);
        }      
  textSize(50);
  textAlign(CENTER, CENTER);
  text(text, x + w/2, y + h/2);
  }
  
  public void mousePressed(){
    if (isInBounds()){
      pressed = true;
      }
    }
  
  public void mouseReleased(){
    if (isInBounds() && pressed){
    
      System.out.println("");
      System.out.println("");
      System.out.println("");
      System.out.println("");
      
      action.actionPerformed(this);
    } pressed = false;
  }
  
  private boolean isInBounds(){
    //linker Rand; rechter Rand; oberer Rand; unterer Rand
  return (x <= mouseX && x+w >= mouseX && y <= mouseY && y+h >= mouseY);
  
  }
  public String getText(){
    return text;
  }
  public int getX(){
    return x;
  }
  public int getWidth(){
    return w;
  }
  public int getHeight(){
    return h;
  }
  //Setter Methoden
  public void setText(String t){
    text = t;
  }
}