package model.bean;

public class Chart {
	int data;
	String label;

	public Chart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Chart(int data, String label) {
		this.data = data;
		this.label = label;
	}

	public int getData() {
		return data;
	}

	public void setData(int data) {
		this.data = data;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

}
