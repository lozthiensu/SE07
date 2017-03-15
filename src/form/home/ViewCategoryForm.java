package form.home;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Account;
import model.bean.Category;
import model.bean.CategoryWithThread;
import model.bean.Thread;

public class ViewCategoryForm extends ActionForm {
	int categoryId;
	Account account;
	Category category;
	ArrayList<Category> categories;
	ArrayList<Thread> threads;
	int page = 1;
	int total = 1;

	public ViewCategoryForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ViewCategoryForm(Account account, Category category, ArrayList<Thread> threads, int page, int total) {
		super();
		this.account = account;
		this.category = category;
		this.threads = threads;
		this.page = page;
		this.total = total;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public ArrayList<Thread> getThreads() {
		return threads;
	}

	public void setThreads(ArrayList<Thread> threads) {
		this.threads = threads;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public ArrayList<Category> getCategories() {
		return categories;
	}

	public void setCategories(ArrayList<Category> categories) {
		this.categories = categories;
	}

	public ArrayList<Thread> getCategoryWithThreads() {
		return threads;
	}

	public void setCategoryWithThreads(ArrayList<CategoryWithThread> categoryWithThreads) {
		this.threads = threads;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
