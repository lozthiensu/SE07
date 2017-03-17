package action.home;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.home.CompareForm;
import form.home.HomeViewForm;
import form.home.ViewThreadForm;
import model.bean.Category;
import model.bean.CategoryWithThread;
import model.bean.Rate;
import model.bean.Thread;
import model.bo.CategoryBO;
import model.bo.ImageBO;
import model.bo.RateBO;
import model.bo.ThreadBO;
import statics.Log;

public class CompareAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		CompareForm compareForm = (CompareForm) form;

		CategoryBO categoryBO = new CategoryBO();
		ArrayList<Category> categories = new ArrayList<Category>();
		categories = categoryBO.getList();
		compareForm.setCategories(categories);
		ThreadBO threadBO = new ThreadBO();
		int thread1Id = compareForm.getThread1Id();
		int thread2Id = compareForm.getThread2Id();
		
		if (thread1Id <= 0 || thread2Id <= 0) {
			Log.in("Thread 1: " + thread1Id);
			Log.in("Thread 2: " + thread2Id);
		//	return mapping.findForward("failed");
		}
		
		Thread thread = new Thread();
		thread.setThreadId(thread1Id);
		Thread thread2 = new Thread();
		thread2.setThreadId(thread2Id);

		thread = threadBO.getById(thread);
		thread2 = threadBO.getById(thread2);
		
		compareForm.setThread(thread);
		compareForm.setThread2(thread2);
		

		Log.in("Thread 1: " + thread.toString());
		Log.in("Thread 2: " + thread2.toString());
		return mapping.findForward("compared");

	}
}
