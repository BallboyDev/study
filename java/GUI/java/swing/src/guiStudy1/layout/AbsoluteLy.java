package guiStudy1.layout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class AbsoluteLy extends JFrame{
	
	JPanel jp = new JPanel();
	JButton jb1 = new JButton("1");
	JButton jb2 = new JButton("2");
	JButton jb3 = new JButton("3");
	JButton jb4 = new JButton("4");
	JButton jb5 = new JButton("5");
	
	public AbsoluteLy() {
		jp.setLayout(null);
		jb1.setBounds(50, 50, 50, 50);
		jb2.setBounds(50, 150, 50, 50);
		jb3.setBounds(50, 250, 50, 50);
		jb4.setBounds(150, 50, 50, 50);
		jb5.setBounds(150, 150, 50, 50);
		
		jp.add(jb1);
		jp.add(jb2);
		jp.add(jb3);
		jp.add(jb4);
		jp.add(jb5);
		
		add(jp);
		
		setTitle("Absolute Layout");
		setSize(400, 500);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
}
