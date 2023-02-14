package app;

public class Girlfriend {
	private String name;
	private String distance;
	private String personality;
	private String age;
	
	public Girlfriend(String name, String distance, String personality, String age) {
		super();
		this.name = name;
		this.distance = distance;
		this.personality = personality;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getPersonality() {
		return personality;
	}

	public void setPersonality(String personality) {
		this.personality = personality;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
}
