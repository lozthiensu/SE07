package form.home;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Account;
import model.bean.Category;
import model.bean.CategoryWithThread;

public class HomeViewForm extends ActionForm {
	Account account;
	ArrayList<Category> categories;
	ArrayList<CategoryWithThread> categoryWithThreads;
	ArrayList<model.bean.Thread> rateHighest;
	ArrayList<model.bean.Thread> viewHighest;

	public HomeViewForm() {
		super();
	}

	public HomeViewForm(Account account, ArrayList<Category> categories,
			ArrayList<CategoryWithThread> categoryWithThreads, ArrayList<model.bean.Thread> rateHighest,
			ArrayList<model.bean.Thread> viewHighest) {
		this.account = account;
		this.categories = categories;
		this.categoryWithThreads = categoryWithThreads;
		this.rateHighest = rateHighest;
		this.viewHighest = viewHighest;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public ArrayList<Category> getCategories() {
		return categories;
	}

	public void setCategories(ArrayList<Category> categories) {
		this.categories = categories;
	}

	public ArrayList<CategoryWithThread> getCategoryWithThreads() {
		return categoryWithThreads;
	}

	public void setCategoryWithThreads(ArrayList<CategoryWithThread> categoryWithThreads) {
		this.categoryWithThreads = categoryWithThreads;
	}

	public ArrayList<model.bean.Thread> getRateHighest() {
		return rateHighest;
	}

	public void setRateHighest(ArrayList<model.bean.Thread> rateHighest) {
		this.rateHighest = rateHighest;
	}

	public ArrayList<model.bean.Thread> getViewHighest() {
		return viewHighest;
	}

	public void setViewHighest(ArrayList<model.bean.Thread> viewHighest) {
		this.viewHighest = viewHighest;
	}

}
