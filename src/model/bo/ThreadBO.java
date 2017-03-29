package model.bo;

import java.util.ArrayList;

import form.user.thread.ThreadForm;
import model.bean.Account;
import model.bean.Category;
import model.bean.Thread;
import model.dao.ThreadDAO;

public class ThreadBO {
	ThreadDAO threadDAO = new ThreadDAO();

	public ArrayList<Thread> getList() {
		return threadDAO.getList();
	}

	public ArrayList<Thread> getListMostView() {
		return threadDAO.getListMostView();
	}

	public ArrayList<Thread> getListByCategory(Category category, int page) {
		return threadDAO.getListByCategory(category, page);
	}

	public ArrayList<Thread> getListByAccount(Account account, int page) {
		return threadDAO.getListByAccount(account, page);
	}

	public ArrayList<Thread> searchBy(Thread thread, int page) {
		return threadDAO.searchBy(thread, page);
	}

	public ArrayList<Thread> searchByAdd(ThreadForm thread) {
		return threadDAO.searchByAdd(thread);
	}

	public Thread getById(Thread thread) {
		return threadDAO.getById(thread);
	}

	public ArrayList<Thread> getRelateThreadsByThread(Thread thread) {
		// TODO Auto-generated method stub
		return threadDAO.getRelateThreadsByThread(thread);
	}

	public boolean delete(Thread thread) {
		return threadDAO.delete(thread);
	}

	public boolean edit(ThreadForm thread) {
		return threadDAO.edit(thread);
	}

	public int add(ThreadForm threadForm) {
		return threadDAO.add(threadForm);
	}

	public ArrayList<Thread> getListByAccountMod(Account accountData, int page) {
		return threadDAO.getListByAccountMod(accountData, page);
	}

	public boolean verify(Thread thread) {
		return threadDAO.verify(thread);
	}

	public boolean changeAvailable(Thread thread) {
		return threadDAO.changeAvailable(thread);
	}
}
