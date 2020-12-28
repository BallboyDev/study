package guiStudy1.layout;

import java.awt.CardLayout;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

public class CardLy_getContentPane extends JFrame implements ActionListener{
	
	JButton jb1 = new JButton("a");
	JButton jb2 = new JButton("b");
	JButton jb3 = new JButton("c");
	JButton jb4 = new JButton("d");
	JButton jb5 = new JButton("e");
	Container c;
	CardLayout cardLy = new CardLayout();
	
	public CardLy_getContentPane() {
		c = this.getContentPane();
		c.setLayout(cardLy);
		
		jb1.addActionListener(this);
		jb2.addActionListener(this);
		jb3.addActionListener(this);
		jb4.addActionListener(this);
		jb5.addActionListener(this);
		
		c.add(jb1);
		c.add(jb2);
		c.add(jb3);
		c.add(jb4);
		c.add(jb5);
		
		this.setTitle("Card Layout (with. getContentPane)");
		this.setSize(300, 400);
		this.setVisible(true);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		cardLy.next(c);
	}

}
