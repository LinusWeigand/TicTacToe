public class ResetActionListener implements ActionListener{
 private TicTacToe t;
 public ResetActionListener(TicTacToe t){
   this.t = t;
 }
 void actionPerformed (Button b){
   t.resetGame();
 }
}