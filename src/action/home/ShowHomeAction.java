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

		HomeViewForm homeViewForm = (HomeViewForm) form;

		CategoryBO categoryBO = new CategoryBO();
		ThreadBO threadBO = new ThreadBO();
		ArrayList<Category> categories = new ArrayList<Category>();
		ArrayList<CategoryWithThread> categoryWithThreads = new ArrayList<CategoryWithThread>();
		categories = categoryBO.getList();
		for (Category category : categories) {
			ArrayList<Thread> threads = threadBO.getListByCategory(category, 1);
			if (threads.size() > 0)
				categoryWithThreads.add(new CategoryWithThread(category.getCategoryId(), category.getName(), threads));
		}
		homeViewForm.setCategories(categories);

		homeViewForm.setCategoryWithThreads(categoryWithThreads);

		homeViewForm.setViewHighest(threadBO.getListMostView());

		return mapping.findForward("home");
	}
}
