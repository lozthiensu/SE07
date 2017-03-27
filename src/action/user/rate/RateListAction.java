package action.user.rate;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import form.user.rate.RateListForm;
import form.user.thread.ThreadListForm;
import model.bean.Account;
import model.bean.Rate;
import model.bean.Thread;
import model.bo.AccountBO;
import model.bo.RateBO;
import model.bo.ThreadBO;
import statics.Log;

public class RateListAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		RateListForm rateListForm  = (RateListForm) form;

		Account account = new Account();
		AccountBO accountBO = new AccountBO();
		RateBO rateBO = new RateBO();	
		ThreadBO threadBO = new ThreadBO();
		HttpSession httpSession = request.getSession();
		try {
			account.setEmail(httpSession.getAttribute("email").toString());
			account.setPassword(httpSession.getAttribute("password").toString());
		} catch (Exception e) {
			return mapping.findForward("failed");
		}
		//Log.in(account.toString());
		Account accountData = accountBO.checkLoginAccount(account);
		if (accountData.getAccountId() > 0) {
			Log.in(accountData.toString());
			Gson gson = new Gson();
			String json = gson.toJson(accountData);
			httpSession.setAttribute("email", accountData.getEmail());
			httpSession.setAttribute("password", accountData.getPassword());
			accountData.setPassword("");
		} else {
			return mapping.findForward("failed");
		}

		// Lấy số trang cần xem
		int page = rateListForm.getPage();

		ArrayList<Rate> rates = new ArrayList<Rate>();
		rates = rateBO.getListByAccount(accountData, page);
		rateListForm.setRates(rates);
		try {
			Log.in(rates.get(0).getTotal() + " totalPage");
			if (rates.get(0).getTotal() > 0)
				rateListForm.setTotalPage(rates.get(0).getTotal());
		} catch (Exception e) {
			rateListForm.setTotalPage(0);
		}

		return mapping.findForward("success");

	}
}
