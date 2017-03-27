package model.bean;

import java.util.ArrayList;

public class DashBoard {

	int numOfAccount;
	int numOfAccountLock;
	int numOfAccountActive;
	int perAccount;
	int numOfThread;
	int numOfThreadLock;
	int numOfThreadActive;
	int perThread;
	int numOfRate;
	int numOfRateMax;
	int perRate;
	ArrayList<Chart> chartThread;
	ArrayList<Chart> chartRate;
	String jsonThread;
	String jsonRate;

	public DashBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DashBoard(int numOfAccount, int numOfAccountLock, int numOfAccountActive, int numOfThread,
			int numOfThreadLock, int numOfThreadActive, int numOfRate) {
		this.numOfAccount = numOfAccount;
		this.numOfAccountLock = numOfAccountLock;
		this.numOfAccountActive = numOfAccountActive;
		this.numOfThread = numOfThread;
		this.numOfThreadLock = numOfThreadLock;
		this.numOfThreadActive = numOfThreadActive;
		this.numOfRate = numOfRate;
	}

	public int getNumOfAccount() {
		return numOfAccount;
	}

	public void setNumOfAccount(int numOfAccount) {
		this.numOfAccount = numOfAccount;
	}

	public int getNumOfAccountLock() {
		return numOfAccountLock;
	}

	public void setNumOfAccountLock(int numOfAccountLock) {
		this.numOfAccountLock = numOfAccountLock;
	}

	public int getNumOfAccountActive() {
		return numOfAccountActive;
	}

	public void setNumOfAccountActive(int numOfAccountActive) {
		this.numOfAccountActive = numOfAccountActive;
	}

	public int getNumOfThread() {
		return numOfThread;
	}

	public void setNumOfThread(int numOfThread) {
		this.numOfThread = numOfThread;
	}

	public int getNumOfThreadLock() {
		return numOfThreadLock;
	}

	public void setNumOfThreadLock(int numOfThreadLock) {
		this.numOfThreadLock = numOfThreadLock;
	}

	public int getNumOfThreadActive() {
		return numOfThreadActive;
	}

	public void setNumOfThreadActive(int numOfThreadActive) {
		this.numOfThreadActive = numOfThreadActive;
	}

	public int getNumOfRate() {
		return numOfRate;
	}

	public void setNumOfRate(int numOfRate) {
		this.numOfRate = numOfRate;
	}

	public int getPerAccount() {
		return perAccount;
	}

	public void setPerAccount(int perAccount) {
		this.perAccount = perAccount;
	}

	public int getPerThread() {
		return perThread;
	}

	public void setPerThread(int perThread) {
		this.perThread = perThread;
	}

	public int getNumOfRateMax() {
		return numOfRateMax;
	}

	public void setNumOfRateMax(int numOfRateMax) {
		this.numOfRateMax = numOfRateMax;
	}

	public int getPerRate() {
		return perRate;
	}

	public void setPerRate(int perRate) {
		this.perRate = perRate;
	}

	public ArrayList<Chart> getChartThread() {
		return chartThread;
	}

	public void setChartThread(ArrayList<Chart> chartThread) {
		this.chartThread = chartThread;
	}

	public ArrayList<Chart> getChartRate() {
		return chartRate;
	}

	public void setChartRate(ArrayList<Chart> chartRate) {
		this.chartRate = chartRate;
	}

	public String getJsonThread() {
		return jsonThread;
	}

	public void setJsonThread(String jsonThread) {
		this.jsonThread = jsonThread;
	}

	public String getJsonRate() {
		return jsonRate;
	}

	public void setJsonRate(String jsonRate) {
		this.jsonRate = jsonRate;
	}

}
