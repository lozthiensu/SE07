package action.home;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.admin.account.AccountListForm;
import form.home.HomeViewForm;
import model.bean.Account;
import model.bean.Category;
import model.bean.CategoryWithThread;
import model.bean.Thread;
import model.bo.AccountBO;
import model.bo.CategoryBO;
import model.bo.ThreadBO;
import statics.Log;
import statics.Pagination;

public class ShowHomeAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// accountListForm tương tác dữ liệu từ form
		HomeViewForm homeViewForm = (HomeViewForm) form;

		//BO để tương tác vs csdl
		CategoryBO categoryBO = new CategoryBO();
		ThreadBO threadBO = new ThreadBO();
		
		ArrayList<Category> categories = new ArrayList<Category>();
		ArrayList<CategoryWithThread> categoryWithThreads = new ArrayList<CategoryWithThread>();
		categories = categoryBO.getList();
		for (Category category : categories) {
			ArrayList<Thread> threads = threadBO.getListByCategory(category);
			categoryWithThreads.add(new CategoryWithThread(category.getCategoryId(), category.getName(), threads));
		}
		homeViewForm.setCategories(categories);
		
		homeViewForm.setCategoryWithThreads(categoryWithThreads);
		
		homeViewForm.setViewHighest(threadBO.getListMostView());
/*
		// Lấy số trang cần xem
		int page = accountListForm.getPage();

		// Lấy danh sách account từ csdl và lưu vào accounts
		ArrayList<Account> accounts = accountBO.getListAccount(page);

		// Gán accounts lên form
		accountListForm.setAccounts(accounts);

		// Gán số trang hiện tại lên form
		accountListForm.setPage(Pagination.page);

		// Gán tổng số trang lên form
		accountListForm.setTotalPage(Pagination.totalPage);*/

		// Trả v�? trang listAccounts
		return mapping.findForward("home");
	}
}
