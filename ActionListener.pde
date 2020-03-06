public interface ActionListener{
    void actionPerformed(Button b);
  }
   public class ActionListenerA implements ActionListener{
    public void actionPerformed(Button b){
      System.out.println(b.getText());
    }
  }