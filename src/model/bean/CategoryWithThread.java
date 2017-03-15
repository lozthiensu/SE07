package model.bean;

import java.util.ArrayList;

public class CategoryWithThread {

	int categoryId;
	String name;
	ArrayList<Thread> threads;

	public CategoryWithThread() {
		super();
	}

	public CategoryWithThread(int categoryId, String name, ArrayList<Thread> threads) {
		super();
		this.categoryId = categoryId;
		this.name = name;
		this.threads = threads;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<Thread> getThreads() {
		return threads;
	}

	public void setThreads(ArrayList<Thread> threads) {
		this.threads = threads;
	}

	@Override
	public String toString() {
		return "CategoryWithThread [categoryId=" + categoryId + ", name=" + name + ", threads=" + threads + "]";
	}

}
