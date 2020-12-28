package guiStudy1.Component;

import java.awt.GridBagLayout;
import java.awt.GridLayout;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class LabelComponent extends BaseLayout{
	JPanel jp = new JPanel();
	
	public LabelComponent() {
		JLabel jl1 = new JLabel("jLabel1");
		JLabel jl2 = new JLabel("jLabel2");
		
		
		jp.add(jl1);
		jp.add(jl2);
		
		this.add(jp);
	}

}
