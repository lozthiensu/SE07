package model.bo;

import java.util.ArrayList;

import model.bean.Account;
import model.bean.Category;
import model.dao.AccountDAO;
import model.dao.CategoryDAO;

public class CategoryBO {

	CategoryDAO categoryDAO = new CategoryDAO();

	public ArrayList<Category> getList() {
		return categoryDAO.getList();
	}

	public void delete(Category category) {
		categoryDAO.delete(category);
	}

	public void add(Category category) {
		categoryDAO.add(category);
	}

	public Category getById(Category category) {
		return categoryDAO.getById(category);
	}

	public void edit(Category category) {
		categoryDAO.edit(category);
	}
}
