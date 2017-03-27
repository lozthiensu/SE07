package action.home;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.home.HomeViewForm;
import form.home.ViewThreadForm;
import model.bean.Category;
import model.bean.CategoryWithThread;
import model.bean.Login;
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

		/* Khai bao action form */
		ViewThreadForm viewThreadForm = (ViewThreadForm) form;

		/* Khai bao BO */
		CategoryBO categoryBO = new CategoryBO();
		ThreadBO threadBO = new ThreadBO();
		ImageBO imageBO = new ImageBO();
		RateBO rateBO = new RateBO();

		/* Khai bao thread new, doc thread ra tu SQL */
		Thread thread = new Thread();
		thread.setThreadId(viewThreadForm.getThreadId());
		viewThreadForm.setThread(threadBO.getById(thread));

		/* Neu bai viet khong ton tai, return failed */
		if (viewThreadForm.getThread().getThreadId() == 0) {
			return mapping.findForward("failed");
		}

		/* Lay danh sach danh muc */
		ArrayList<Category> categories = new ArrayList<Category>();
		categories = categoryBO.getList();
		viewThreadForm.setCategories(categories);

		/* Lay danh sach hinh anh cua bai viet */
		viewThreadForm.setImages(imageBO.getListByThread(thread));

		/* Lay danh sach hinh anh 360 cua bai viet */
		viewThreadForm.setImages360(imageBO.getList360ByThread(thread));

		/* Lay danh sach bai viet lien quan cua bai viet */
		viewThreadForm.setRelateThreads(threadBO.getRelateThreadsByThread(thread));

		/* Khai bao session */
		HttpSession httpSession = request.getSession();

		/* Lay accountId duoc luu trong ssesion */
		int accountId = 0;
		try {
			accountId = (Integer) httpSession.getAttribute("accountId");
		} catch (Exception e) {
		}

		/* Lay danh sach danh gia bai viet */
		ArrayList<Rate> rates = rateBO.getListByThread(thread, accountId);
		viewThreadForm.setRates(rates);
		viewThreadForm.setRatesCount(rates.size());

		/*
		 * Neu bai viet chua duoc xac nhan, thi chi cho phep nguoi viet bai xem
		 * bai
		 */
		if (viewThreadForm.getThread().getStatus() != 1 && viewThreadForm.getThread().getAccountId() != accountId) {
			return mapping.findForward("failed");
		}

		/* Doc thread thanh cong */
		return mapping.findForward("viewThread");
	}
}
