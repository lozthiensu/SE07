package form.user.thread;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Thread;

public class ThreadListForm extends ActionForm {
	int page = 1;
	int totalPage = 1;
	ArrayList<Thread> threads;

	public ThreadListForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ThreadListForm(int page, int totalPage, ArrayList<Thread> threads) {
		super();
		this.page = page;
		this.totalPage = totalPage;
		this.threads = threads;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public ArrayList<Thread> getThreads() {
		return threads;
	}

	public void setThreads(ArrayList<Thread> threads) {
		this.threads = threads;
	}
 

}
