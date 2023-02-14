package app;

import jess.JessException;
import jess.QueryResult;
import jess.ValueVector;

public class Query {
	public Query() {
		try {
			QueryResult qr = Main.engine.runQueryStar("get-gfs", 
					new ValueVector());
			while (qr.next()) {
				System.out.println("Partner Name		: " + qr.getString("name"));
				System.out.println("Partner Distance	: " +qr.getString("distance"));
				System.out.println("Partner Personality	: " +qr.getString("personality"));				
				System.out.println("Partner Age		: " +qr.getString("age"));				
				System.out.println("======================================");				
			}
		} catch (JessException e) {
			e.printStackTrace();
		}
	}
}
