import javax.swing.*;

public class Main extends JFrame {
    private Main() {
        this.setSize(518, 545);
        this.setLocationRelativeTo(null);
        this.setResizable(false);
        this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        this.setTitle("NN");
        this.add(new Panel());
        this.setVisible(true);
    }

    public static void main(String[] args) {
        new Main();
    }
}
