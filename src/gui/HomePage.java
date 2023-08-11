package gui;

import javax.swing.*;
import java.awt.*;


public class HomePage {

    static JFrame home = new JFrame();
    static JButton set = new JButton();

    public static void display(boolean show) {
        set.setSize(20, 20);
        set.setLocation(302, 83);
        home.add(set);
        Dimension size = set.getSize();
        System.out.println(size);
        home.setLocation(300, 80);
        home.setVisible(show);
        
    }

    private static void addComponents() {

    }

    private static void setButton() {
        set.setBounds(20, 20, 20, 20);
    }

}
