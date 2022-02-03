package guiStudy1.layout;

import java.awt.Component;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class GridBagLy extends JFrame{
	
	JPanel jp = new JPanel();
	JButton jBtn_0 = new JButton("0");
	JButton jBtn_1 = new JButton("1");
	JButton jBtn_2 = new JButton("2");
	JButton jBtn_3 = new JButton("3");
	JButton jBtn_4 = new JButton("4");
	JButton jBtn_5 = new JButton("5");
	JButton jBtn_6 = new JButton("6");
	JButton jBtn_7 = new JButton("7");
	JButton jBtn_8 = new JButton("8");
	JButton jBtn_9 = new JButton("9");
	JButton jBtn_10 = new JButton("10");
	JButton jBtn_11 = new JButton("11");
	GridBagConstraints gbc = new GridBagConstraints();
	
	public GridBagLy() {
		jp.setLayout(new GridBagLayout());
		
		gbc.weightx = 1.0;
		gbc.weighty = 1.0;
		gbc.fill = GridBagConstraints.BOTH;
		
		this.setGbc(jBtn_0, 0, 0, 1, 2);
		this.setGbc(jBtn_1, 1, 1, 1, 1);
		this.setGbc(jBtn_2, 2, 1, 1, 1);
		this.setGbc(jBtn_3, 3, 1, 3, 1);
		this.setGbc(jBtn_4, 0, 2, 1, 2);
		this.setGbc(jBtn_5, 1, 2, 1, 1);
		this.setGbc(jBtn_6, 1, 3, 1, 1);
		this.setGbc(jBtn_7, 2, 2, 1, 1);
		this.setGbc(jBtn_8, 2, 3, 1, 1);
		this.setGbc(jBtn_9, 3, 2, 3, 2);
		
		this.add(jp);
		
		this.setTitle("GridBag Layout");
		this.setSize(500, 500);
		this.setVisible(true);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
//	gridx: grid행렬의 시작점 x좌표 
//	gridy: grid행렬의 시적점 y좌표
//	gridwidth: grid행렬의 가로 길이
//	gridheight: grid행렬의 세로 길이
//	weightx, weighty: 비율로 영역 분배
//	fill: component를 배치하고 남은 여백 채우기
//		BOTH: x, y축 채우기
//		HORIZONTAL: x축 채우기
//		VERTICAL: y축 채우기
//		NONE: 여백 채우기 설정 없이 그대로
	
	public void setGbc(Component obj, int x, int y, int w, int h) {
		gbc.gridx = x;
		gbc.gridy = y;
		gbc.gridwidth = w;
		gbc.gridheight = h;
		jp.add(obj, gbc);
	}
	
	
	

}
