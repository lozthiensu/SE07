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
import model.bean.Rate;
import model.bean.Thread;
import model.bo.CategoryBO;
import model.bo.ImageBO;
import model.bo.RateBO;
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
		RateBO rateBO = new RateBO();
 
		Thread thread = new Thread();
		thread.setThreadId(viewThreadForm.getThreadId());
		viewThreadForm.setThread(threadBO.getById(thread));
		
		Log.in("Id bai viet " + viewThreadForm.getThreadId());
		
		

		if(viewThreadForm.getThread().getThreadId() == 0){
			Log.in("Thoat");
			return mapping.findForward("failed");
		}
		Log.in("Wifi: " + viewThreadForm.getThread().isWifi() + " , Old: " + viewThreadForm.getThread().isOld());
		
		ArrayList<Category> categories = new ArrayList<Category>();
		categories = categoryBO.getList();
		viewThreadForm.setCategories(categories);
		viewThreadForm.setImages(imageBO.getListByThread(thread));
		Log.in("Image: " + imageBO.getListByThread(thread));
		viewThreadForm.setImages360(imageBO.getList360ByThread(thread));
		viewThreadForm.setRelateThreads(threadBO.getRelateThreadsByThread(thread));
		
		Log.in("Lien quan: " + viewThreadForm.getRelateThreads().toString());
		
		
		ArrayList<Rate> rates = rateBO.getListByThread(thread);
		viewThreadForm.setRates(rates);
		viewThreadForm.setRatesCount(rates.size());
		
		//Log.in("Wifi: " + viewThreadForm.getThread().isWifi() + " , Old: " + viewThreadForm.getThread().isOld());
		
		//Log.in(imageBO.getListByThread(thread));
		//Log.in("Rate " + viewThreadForm.getRates());
		//Log.in("Related " + viewThreadForm.getRelateThreads());
		
		return mapping.findForward("viewThread");
	}
}
