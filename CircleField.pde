public class CircleField extends Field{
  
  public CircleField(int x, int y, int w, int h){
    super(x,y,w,h);
  }
  
  public void draw(){
   strokeWeight(2);
   fill(255);
   stroke(0);
   
   if (isMarked){
    fill (0,255,100); 
       }
   rect(x,y,w,h);
   
   stroke(0,0,255);
   strokeWeight(5);
   noFill();
   
   ellipse(x+w/2, y+h/2, 2*w/3,2*h/3);
  
    }
 public void mousePressed(){
  }
 public int getType(){
   return 0;
  }
}