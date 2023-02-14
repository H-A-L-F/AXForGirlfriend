package app;

import jess.JessException;
import jess.Rete;

public class Main {
	
	public static Rete engine;
	
	public Main() {
		engine = new Rete();
		try {
			engine.batch("app/main.clp");
			engine.reset();
			engine.run();
		} catch (JessException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
