public class CrossField extends Field{
 public CrossField(int x, int y , int w ,int h ) {
   super(x,y,w,h);
 }
 
 public void draw(){
   strokeWeight(2);
   if (isMarked){
   fill(0,255,100);//grün falls markiert
   }else{
   fill(255);
   }
   stroke(0);
   
   if (isMarked){
    fill (0,255,100); 
       }else{
       fill(255);
       }
   rect (x,y,w,h);
 
 
 strokeWeight(5);
 stroke(255,0,0);
 line(x+w/4, y+h/4, x+3*w/4, y+3*h/4); //links oben, rechts unten
 line(x+3*w/4, y+h/4, x+w/4, y+3*h/4); //rechts oben, links unten
 
      }
public void mousePressed(){
    }
 
 public int getType(){
   return 1;
  }
}