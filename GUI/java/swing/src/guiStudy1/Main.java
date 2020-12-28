package guiStudy1;

import guiStudy1.Component.LabelComponent;
import guiStudy1.layout.AbsoluteLy;
import guiStudy1.layout.BorderLy;
import guiStudy1.layout.CardLy_JPanel;
import guiStudy1.layout.CardLy_getContentPane;
import guiStudy1.layout.FlowLy;
import guiStudy1.layout.GridLy;
import guiStudy1.layout.GridBagLy;

public class Main {
	public static void main(String[] args) {
		
//		예제 코드 실행
		Object ex = getExample("Grid");
		

	}
	
	
	public static Object getExample(String c) {
		switch(c) {
			case "JFrame":		// 기본 프레임 생성 예제
				return  new MyFrame();
			
/************ Layout ************/
			case "Absolute":	// 절대위치 Layout 에제
				return new AbsoluteLy();
			case "Border":		// Border Layout 에제
				return new BorderLy();
			case "Flow":		// Flow Layout 에제
				return new FlowLy();
			case "Grid":		// Grid Layout 에제
				return new GridLy();
			case "GridBag":		// gridBag Layout 에제
				return new GridBagLy();
			case "Card_getContentPane":		// Card Layout 에제1
				return new CardLy_getContentPane();
			case "Card_JPanel":			// Card Layout 에제2
				return new CardLy_JPanel();

/************ JLabel ************/
			case "JLabel":
				return new LabelComponent();
				
			default:
				return new MyFrame();
		}
	}
}
