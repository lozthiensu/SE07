package form.home;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Account;
import model.bean.Category;
import model.bean.Image;
import model.bean.Rate;
import model.bean.Thread;

public class CompareForm extends ActionForm {
	int thread1Id;
	int thread2Id;
	Thread thread;
	Thread thread2;
	ArrayList<Category> categories;

	public ArrayList<Category> getCategories() {
		return categories;
	}

	public void setCategories(ArrayList<Category> categories) {
		this.categories = categories;
	}

	public CompareForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CompareForm(int thread1Id, int thread2Id, Thread thread, Thread thread2) {
		super();
		this.thread1Id = thread1Id;
		this.thread2Id = thread2Id;
		this.thread = thread;
		this.thread2 = thread2;
	}

	public int getThread1Id() {
		return thread1Id;
	}

	public void setThread1Id(int thread1Id) {
		this.thread1Id = thread1Id;
	}

	public int getThread2Id() {
		return thread2Id;
	}

	public void setThread2Id(int thread2Id) {
		this.thread2Id = thread2Id;
	}

	public Thread getThread() {
		return thread;
	}

	public void setThread(Thread thread) {
		this.thread = thread;
	}

	public Thread getThread2() {
		return thread2;
	}

	public void setThread2(Thread thread2) {
		this.thread2 = thread2;
	}

}
