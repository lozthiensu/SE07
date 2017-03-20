package action.home;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import form.home.AccountHomeForm;
import form.home.RateHomeForm;
import model.bean.Account;
import model.bean.Login;
import model.bean.Rate;
import model.bean.Thread;
import model.bo.AccountBO;
import model.bo.LoginBO;
import model.bo.RateBO;
import statics.Log;

public class RateAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		RateHomeForm rateHomeForm = (RateHomeForm) form;

		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");
		PrintWriter out = response.getWriter();

		LoginBO loginBO = new LoginBO();

		Rate rate = new Rate(0, rateHomeForm.getThreadId(), rateHomeForm.getAccountId(), null, null, null,
				rateHomeForm.getContent(), rateHomeForm.getScore());
		RateBO rateBO = new RateBO();

		String action = rateHomeForm.getAction();
		Gson gson = new Gson();
		ArrayList<Rate> rates = new ArrayList<Rate>();
		Thread thread = new Thread();
		thread.setThreadId(rateHomeForm.getThreadId());
		Log.in("action: " + action);
		if (action.equals("addNew")) {
			HttpSession httpSession = request.getSession();
			String email = (String) httpSession.getAttribute("email");
			String password = (String) httpSession.getAttribute("password");
			Log.in(email + " " + password + " session"); 
			if (loginBO.checkLogin(new Login(email, password)) == true) {
				Log.in("Bat dau add rate");
				if (rateBO.addRate(rate) == true) {
					rates = rateBO.getListByThread(thread);
					String json = gson.toJson(rates);
					out.print(json);
					Log.in("Add rate thanh cong");
				} else {
					String json = gson.toJson(rates);
					out.print(json);
					Log.in("Add rate that bai");
				}
			} else {
				String json = gson.toJson(rates);
				out.print(json);
				Log.in("Dang nhap that bai");
			}
		}
		out.flush();
		return null;
	}
}
