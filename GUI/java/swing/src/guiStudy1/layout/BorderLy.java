package guiStudy1.layout;

import java.awt.BorderLayout;

import javax.swing.*;

public class BorderLy extends JFrame{
	
	JPanel jp = new JPanel();
	JButton jb1 = new JButton("North");
	JButton jb2 = new JButton("West");
	JButton jb3 = new JButton("Center");
	JButton jb4 = new JButton("East");
	JButton jb5 = new JButton("South");
	
	public BorderLy() {
		// BizCube의 Dock Panel과 같은 기능
		// top, bottom, left, right, fill을
		// North, South, West, East, Center 키워드로 관리한다.
		jp.setLayout(new BorderLayout());
		
		jp.add(jb1, "North");
		jp.add(jb2, "West");
		jp.add(jb3, "Center");
		jp.add(jb4, "East");
		jp.add(jb5, "South");
		
		add(jp);
		
		setTitle("Border Layout");
		setSize(400, 300);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
}
