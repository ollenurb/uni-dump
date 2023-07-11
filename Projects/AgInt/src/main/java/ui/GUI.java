package ui;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;

// IMPROVEMENT: You can refactor this class to be an Observable of some model with a Flow
public class GUI extends JFrame {

    static int WIDTH = 400;
    static int HEIGHT = 600;
    JLabel lbStatus;
    JLabel lbParticipants;
    JLabel lbElapsedTime;
    JLabel lbPrice;

    // Holds participants
    DefaultListModel<String> listModel;

    public GUI() {
        this.setName("Auction");

        Dimension expectedDimension = new Dimension(WIDTH, HEIGHT);
        Container pane = getContentPane();
        this.setPreferredSize(expectedDimension);
        this.setMaximumSize(expectedDimension);

        // Header content
        JPanel topPane = new JPanel();
        topPane.setLayout(new BoxLayout(topPane, BoxLayout.Y_AXIS));
        topPane.setBorder(new EmptyBorder(new Insets(20, 20, 0, 20)));
        lbStatus = new JLabel("Status: WAITING");
        lbParticipants = new JLabel("Total Participants: 0");
        lbElapsedTime = new JLabel("Elapsed Time: 0");
        lbPrice = new JLabel("Current Price: 0");
        topPane.add(lbStatus);
        topPane.add(Box.createRigidArea(new Dimension(0, 8)));
        topPane.add(lbParticipants);
        topPane.add(Box.createRigidArea(new Dimension(0, 8)));
        topPane.add(lbElapsedTime);
        topPane.add(Box.createRigidArea(new Dimension(0, 8)));
        topPane.add(lbPrice);
        topPane.add(Box.createRigidArea(new Dimension(0, 8)));
        topPane.add(new JLabel("Participants:"));

        // Center content
        JPanel centerPane = new JPanel();
        centerPane.setLayout(new GridLayout(1, 1));
        this.listModel = new DefaultListModel<>();
        JList<String> list = new JList<>(this.listModel);
        centerPane.setBorder(new EmptyBorder(new Insets(8, 20, 20, 20)));
        centerPane.add(list);

        // Bottom content
//        JPanel bottomPane = new JPanel();
//        button = new JButton("Start Auction");
//        priceTxt = new JTextField();
//        JLabel startingPriceLbl = new JLabel("Starting Price:");

//        bottomPane.setLayout(new BoxLayout(bottomPane, BoxLayout.Y_AXIS));
//        bottomPane.setBorder(new EmptyBorder(new Insets(0, 20, 20, 20)));
//        button.setMaximumSize(new Dimension(Integer.MAX_VALUE, Integer.MAX_VALUE));
//        priceTxt.setMaximumSize(new Dimension(Integer.MAX_VALUE, Integer.MAX_VALUE));
//
//        button.setAlignmentX(Component.CENTER_ALIGNMENT);
//        priceTxt.setAlignmentX(Component.CENTER_ALIGNMENT);
//        startingPriceLbl.setAlignmentX(Component.CENTER_ALIGNMENT);
//        startingPriceLbl.setHorizontalTextPosition(SwingConstants.LEFT);
//
//        bottomPane.add(startingPriceLbl);
//        bottomPane.add(Box.createRigidArea(new Dimension(0, 8)));
//        bottomPane.add(priceTxt);
//        bottomPane.add(Box.createRigidArea(new Dimension(0, 8)));
//        bottomPane.add(button);
//
        // Add contents to root pane
        pane.add(topPane, BorderLayout.NORTH);
        pane.add(centerPane, BorderLayout.CENTER);
//        pane.add(bottomPane, BorderLayout.SOUTH);

        pack();
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
    }

    public void addParticipant(String name) {
        SwingUtilities.invokeLater(() -> {
            this.listModel.addElement(name);
            this.lbParticipants.setText("Total Participants: " + this.listModel.size());
        });
    }

    public void removeParticipant(String name) {
        SwingUtilities.invokeLater(() -> {
            this.listModel.removeElement(name);
            this.lbParticipants.setText("Total Participants: " + this.listModel.size());
        });
    }

    public void updateTime(int time) {
        SwingUtilities.invokeLater(() -> this.lbElapsedTime.setText("Elapsed Time: " + time));
    }

    public void updatePrice(float price) {
        SwingUtilities.invokeLater(() -> this.lbPrice.setText("Current Price: " + price));
    }


    public void showWinner(String winner, float price) {
        SwingUtilities.invokeLater(() -> JOptionPane.showMessageDialog(this, winner + " has won the auction at the price of " + price + " euros."));
    }

    public void updateState(String state) {
        SwingUtilities.invokeLater(() -> lbStatus.setText("Status: " + state));
    }

    public static void main(String[] args) {
        GUI gui = new GUI();
        gui.setVisible(true);
    }

}
