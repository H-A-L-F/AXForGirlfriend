package app;

import java.awt.Font;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JTable;

import jess.JessException;
import jess.QueryResult;
import jess.ValueVector;

public class Filter {
	private ArrayList<Girlfriend> gfs = new ArrayList<>();
	String[] columnNames = {"Name", "Distance", "Personality", "Age"};
	
	public Filter() {
		try {
			QueryResult qr = Main.engine.runQueryStar("get_filtered", 
					new ValueVector());
			while (qr.next()) {
				gfs.add(new Girlfriend(qr.getString("name"), qr.getString("distance"), qr.getString("personality"), qr.getString("age")));				
			}
		} catch (JessException e) {
			e.printStackTrace();
		}
		
		Object[][] data = new Object[gfs.size()][4];
		for (int i = 0; i < gfs.size(); i++) {
			data[i][0] = gfs.get(i).getName();
			data[i][1] = gfs.get(i).getDistance();
			data[i][2] = gfs.get(i).getPersonality();
			data[i][3] = gfs.get(i).getAge();
		}
		
		JTable table = new JTable(data, columnNames);
		JFrame frame = new JFrame("Filtered Girlfriend");
		frame.setSize(800,800);
		table.setFont(new Font("Courier", Font.CENTER_BASELINE,30));
		table.setRowHeight(30);
		frame.add(table);
		frame.setVisible(true);
	}
	
	public static void main(String[] args) {
		new Filter();
	}
}
