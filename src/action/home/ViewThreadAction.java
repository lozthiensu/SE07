package action.home;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.home.HomeViewForm;
import form.home.ViewThreadForm;
import model.bean.Category;
import model.bean.CategoryWithThread;
import model.bean.Thread;
import model.bo.CategoryBO;
import model.bo.ImageBO;
import model.bo.ThreadBO;
import statics.Log;

public class ViewThreadAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// accountListForm tương tác dữ liệu từ form
		ViewThreadForm viewThreadForm = (ViewThreadForm) form;

		// BO để tương tác vs csdl
		CategoryBO categoryBO = new CategoryBO();
		ThreadBO threadBO = new ThreadBO();
		ImageBO imageBO = new ImageBO();
 
		Thread thread = new Thread();
		thread.setThreadId(viewThreadForm.getThreadId());
		viewThreadForm.setThread(threadBO.getById(thread));
		
		ArrayList<Category> categories = new ArrayList<Category>();
		categories = categoryBO.getList();
		viewThreadForm.setCategories(categories);
		viewThreadForm.setImages(imageBO.getListByThread(thread));
		viewThreadForm.setImages360(imageBO.getList360ByThread(thread));
		viewThreadForm.setRelateThreads(threadBO.getRelateThreadsByThread(thread));
		Log.in(imageBO.getListByThread(thread));
		Log.in("Related " + viewThreadForm.getRelateThreads());
		return mapping.findForward("viewThread");
	}
}
