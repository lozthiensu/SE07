package model.bean;

public class ChartThreadRate {
	String label;
	int num1;
	int num2;

	public ChartThreadRate() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChartThreadRate(String label, int num1, int num2) {
		super();
		this.label = label;
		this.num1 = num1;
		this.num2 = num2;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public int getNum1() {
		return num1;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	@Override
	public String toString() {
		return "ChartThreadRate [label=" + label + ", num1=" + num1 + ", num2=" + num2 + "]";
	}

}
