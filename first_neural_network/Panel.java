import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.image.BufferedImage;
import java.io.*;

public class Panel extends JPanel {
    private final int STEP = (518 - 6) / 16;
    private byte[][] matrix = new byte[16][16];
    private final int NEURON_COUNT = 10;
    private Neuron[] neuronWeb = new Neuron[NEURON_COUNT];
    private boolean isLearningMode = false;

    Panel() {
        loadNeurons();
        setLearningMode();
        this.addMouseListener(new MouseListener() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int x = (e.getX() - 3) / STEP;
                int y = (e.getY() - 3) / STEP;

                if (matrix[x][y] == 0) matrix[x][y] = -1;
                else matrix[x][y] = 0;

                repaint();
            }

            @Override
            public void mousePressed(MouseEvent e) {}

            @Override
            public void mouseReleased(MouseEvent e) {}

            @Override
            public void mouseEntered(MouseEvent e) {}

            @Override
            public void mouseExited(MouseEvent e) {}
        });

        this.addKeyListener(new KeyListener() {
            @Override
            public void keyTyped(KeyEvent e) {}

            @Override
            public void keyPressed(KeyEvent e) {
                switch (e.getKeyCode()) {
                    case KeyEvent.VK_ENTER:
                        int num = check(matrix);
                        if (isLearningMode) {
                            if (!(JOptionPane.showConfirmDialog(null, num, "Верно ли это?", JOptionPane.YES_NO_OPTION) == 0)) {
                                num = Integer.valueOf(JOptionPane.showInputDialog("Введите правильную цифру"));
                            }

                            writeToFile(num, matrix);
                            loadNeurons();
                        } else {
                            JOptionPane.showMessageDialog(null, "Я думаю, что это " + num);
                        }

                        break;
                    case KeyEvent.VK_I:
                        try {
                            matrix = getLesson("/samples/lessons/" + Integer.valueOf(JOptionPane.showInputDialog("Введите номер цифры")) + ".BMP");
                        } catch (IOException e1) {
                            e1.printStackTrace();
                        }
                        repaint();
                        break;
                    case KeyEvent.VK_C:
                        setLearningMode();
                        break;
                }
            }

            @Override
            public void keyReleased(KeyEvent e) {}
        });

        this.setFocusable(true);
    }

    @Override
    public void paint(Graphics g) {
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, this.getWidth(), this.getHeight());

        g.setColor(Color.orange);
        for (int i = 0; i < 515; i += STEP) {
            g.drawLine(i + 3, 0, i + 3, this.getHeight());
            g.drawLine(0, i + 3, this.getWidth(), i + 3);
        }

        g.setColor(Color.black);
        for (int i = 0; i < 16; i++) {
            for (int j = 0; j < 16; j++) {
                if (matrix[i][j] == 0) {
                    g.fillRect(i * STEP + 3, j * STEP + 3, STEP, STEP);
                }
            }
        }
    }

    private void setLearningMode() {
        isLearningMode = JOptionPane.showConfirmDialog(null, "Обучать нейросеть?", "NN", JOptionPane.YES_NO_OPTION) == 0;
    }

    private void loadNeurons() {
        neuronWeb = new Neuron[10];
        for (int i = 0; i < NEURON_COUNT; i++)
            try {
                neuronWeb[i] = new Neuron(getData(i));
            } catch (IOException e) {
                e.printStackTrace();
            }
    }

    private void writeToFile(int num, byte[][] in) {
        File file = new File("data/" + num);

        try {
            byte[][] arr = getData(num);
            PrintWriter out = new PrintWriter(file.getAbsoluteFile());

            for (int i = 0; i < 16; i++) {
                for (int j = 0; j < 16; j++) {
                    if (arr[i][j] > -1) {
                        if (in[i][j] > -1) {
                            out.print((arr[i][j] + 1) + " ");
                        } else {
                            out.print(arr[i][j] + " ");
                        }
                    } else {
                        if (in[i][j] > -1) {
                            out.print(0 + " ");
                        } else {
                            out.print(-1 + " ");
                        }
                    }
                }
                out.print("\n");
            }

            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void restoreData(File file) {
        try {
            PrintWriter out = new PrintWriter(file.getAbsoluteFile());
            for (int i = 0; i < 16; i++) {
                for (int j = 0; j < 16; j++) {
                    out.print("-1 ");
                }
                out.print("\n");
            }
            out.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    private byte[][] getData(int num) throws IOException {
        byte[][] out = new byte[16][16];
        File file = new File("data/" + num );

        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
            restoreData(file);
        }

        BufferedReader in = new BufferedReader(new FileReader(file));
        String s;
        for (int i = 0; (s = in.readLine()) != null; i++) {
            String[] splitter = s.split(" ");
            for (int j = 0; j < splitter.length - 1; j++) {
                out[i][j] = Byte.valueOf(splitter[j]);
            }
        }

        in.close();
        return out;
    }

    private byte[][] getLesson(String path) throws IOException {
        byte[][] out;

        BufferedImage image = ImageIO.read(getClass().getResourceAsStream(path));
        out = new byte[16][16];

        for (int i = 0; i < image.getWidth(); i++) {
            for (int j = 0; j < image.getHeight(); j++) {
                out[i][j] = (byte) (image.getRGB(i,j));
            }
        }
        return out;
    }

    private int check(byte[][] in) {
        int max = Integer.MIN_VALUE;
        int out = -1;

        for (int i = 0; i < NEURON_COUNT; i++) {
            Neuron neuron = neuronWeb[i];
            int weight = neuron.check(in);
            if (max < weight) {
                max = weight;
                out = i;
            }
        }

        return out;
    }
}
