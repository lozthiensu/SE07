package form.admin.category;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.Account;
import model.bean.Category;

public class CategoryListForm extends ActionForm {
	int page = 1;
	int totalPage = 1;
	ArrayList<Category> categories;

	public CategoryListForm() {
		super();
	}

	public CategoryListForm(int page, int totalPage, ArrayList<Category> categories) {
		super();
		this.page = page;
		this.totalPage = totalPage;
		this.categories = categories;
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

	public ArrayList<Category> getCategories() {
		return categories;
	}

	public void setCategories(ArrayList<Category> categories) {
		this.categories = categories;
	}

}
