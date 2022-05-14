package guiStudy1.layout;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class FlowLy extends JFrame{
	JPanel jp = new JPanel();
	JButton jb1 = new JButton("North");
	JButton jb2 = new JButton("West");
	JButton jb3 = new JButton("Center");
	JButton jb4 = new JButton("East");
	JButton jb5 = new JButton("South");
	
	public FlowLy() {
		
		jp.setLayout(new FlowLayout());
		
		jp.add(jb1);
		jp.add(jb2);
		jp.add(jb3);
		jp.add(jb4);
		jp.add(jb5);
		
		add(jp);
		
		setTitle("Flow Layout");
		setSize(400, 300);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
}
