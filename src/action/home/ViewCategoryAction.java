package action.home;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.home.ViewCategoryForm;
import model.bean.Category;
import model.bean.CategoryWithThread;
import model.bean.Thread;
import model.bo.CategoryBO;
import model.bo.ThreadBO;
import statics.Log;

public class ViewCategoryAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ViewCategoryForm viewCategoryForm = (ViewCategoryForm) form;

		// Khai bao doi tuong BO cua category
		CategoryBO categoryBO = new CategoryBO();

		// Khai bao doi tuong BO cua thread
		ThreadBO threadBO = new ThreadBO();

		// Arrraylist luu tru bai viet
		ArrayList<Thread> threads = new ArrayList<Thread>();
		ArrayList<Category> categories = new ArrayList<Category>();

		// Tao ra doi tuong category tu form
		Category categoryForm = new Category(viewCategoryForm.getCategoryId(), null);
		Category category = categoryBO.getById(categoryForm);
		
		if(category.getCategoryId() == 0){
			return mapping.findForward("failed");
		}

		// Lay so trang can xem   
		int page = viewCategoryForm.getPage();

		// Lay bai viet thuoc category va categories tu db
		threads = threadBO.getListByCategory(categoryForm, page);
		categories = categoryBO.getList();

		// Dua du lieu len form
		viewCategoryForm.setThreads(threads);
		viewCategoryForm.setCategory(category);
		viewCategoryForm.setCategories(categories);
		
		try {
			if(threads.get(0).getTotal() > 0 )
				viewCategoryForm.setTotal(threads.get(0).getTotal());
		} catch (Exception e) {
			viewCategoryForm.setTotal(0);
		}

		return mapping.findForward("viewCategory");
	}
}
