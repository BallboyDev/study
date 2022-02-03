package guiStudy1.layout;

import java.awt.*;
import java.awt.event.*;

import javax.swing.*;

public class CardLy_JPanel extends JFrame implements ActionListener {
	
	JPanel jp = new JPanel();
	JButton jb1 = new JButton("a");
	JButton jb2 = new JButton("b");
	JButton jb3 = new JButton("c");
	JButton jb4 = new JButton("d");
	JButton jb5 = new JButton("e");
	CardLayout cardLy = new CardLayout();
	
	public CardLy_JPanel() {
		jp.setLayout(cardLy);
		
		jb1.addActionListener(this);
		jb2.addActionListener(this);
		jb3.addActionListener(this);
		jb4.addActionListener(this);
		jb5.addActionListener(this);
		
		jp.add(jb1);
		jp.add(jb2);
		jp.add(jb3);
		jp.add(jb4);
		jp.add(jb5);
		
		this.add(jp);
		
		this.setTitle("Card Layout (with. JPanel)");
		this.setSize(400, 300);
		this.setVisible(true);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
	}
	
	@Override
	public void actionPerformed(ActionEvent e){
		cardLy.next(jp);
	}
	
}
