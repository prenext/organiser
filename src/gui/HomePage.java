package gui;

import javax.swing.*;


public class HomePage {

    JFrame home = new JFrame();
    JButton close = new JButton();

    public void display(boolean show) {
        addComponents();
        home.setLocation(200, 40);
        home.setSize(700, 500);
        home.setVisible(show);
    }

    public void addComponents() {
        home.add(close);
    }


}
