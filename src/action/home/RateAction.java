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
import model.bean.Notification;
import model.bean.Rate;
import model.bean.Thread;
import model.bo.AccountBO;
import model.bo.LoginBO;
import model.bo.NotificationBO;
import model.bo.RateBO;
import model.bo.ThreadBO;
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
		NotificationBO notificationBO = new NotificationBO();
		ThreadBO threadBO = new ThreadBO();

		Rate rate = new Rate(0, rateHomeForm.getThreadId(), rateHomeForm.getAccountId(), null, null, null,
				rateHomeForm.getContent(), rateHomeForm.getScore());
		RateBO rateBO = new RateBO();

		String action = rateHomeForm.getAction();
		Gson gson = new Gson();
		ArrayList<Rate> rates = new ArrayList<Rate>();
		Thread thread = new Thread();
		thread.setThreadId(rateHomeForm.getThreadId());
		thread = threadBO.getById(thread);
		Log.in("action: " + action);
		if (action.equals("addNew")) {
			HttpSession httpSession = request.getSession();
			String email = (String) httpSession.getAttribute("email");
			String password = (String) httpSession.getAttribute("password");

			int accountId = 0;
			try {
				accountId = (Integer) httpSession.getAttribute("accountId");
			} catch (Exception e) {
			}
			
			Log.in(email + " " + password + " session");
			if (loginBO.checkLogin(new Login(email, password)) == true) {
				Log.in("Bat dau add rate");
				int rateId = rateBO.addRate(rate);
				if ( rateId > 0) {
					Log.in(rateId);
					if(accountId != thread.getAccountId()){
						AccountBO accountBO = new AccountBO();
						Account account = new Account();
						account.setAccountId(accountId);
						account = accountBO.getAccountById(account);
						String content = "<b>" + account.getName() + "</b> đã đánh giá về bài viết của bạn";
						
						Log.in(rateId + " Push");
						Notification notification = new Notification(0, rate.getThreadId(), rateId, thread.getAccountId(), content, "", "", false);
						notification.setAccountIdPush(accountId);
						notificationBO.add(notification);
					}
					String json = "success";
					out.print(json);
					Log.in("Add rate thanh cong");
				} else {
					String json = "failed";
					out.print(json);
					Log.in("Add rate that bai");
				}
			} else {
				String json = gson.toJson(rates);
				out.print(json);
				Log.in("Dang nhap that bai");
			}
		} else if (action.equals("delete")) {
			HttpSession httpSession = request.getSession();
			String email = (String) httpSession.getAttribute("email");
			String password = (String) httpSession.getAttribute("password");
			int accountId = (Integer) httpSession.getAttribute("accountId");
			int rateId = rateHomeForm.getRateId();
			Log.in(email + " " + password + " " + rateId + " " + accountId);
			if (loginBO.checkLogin(new Login(email, password)) == true) {
				if (rateBO.delete(rateId, accountId) == true) {
					String json = "success";
					out.print(json);
				} else {
					String json = "failed";
					out.print(json);
				}
			} else {
				String json = gson.toJson(rates);
				out.print(json);
			}
		} else if (action.equals("update")) {
			HttpSession httpSession = request.getSession();
			String email = (String) httpSession.getAttribute("email");
			String password = (String) httpSession.getAttribute("password");
			int accountId = (Integer) httpSession.getAttribute("accountId");
			int rateId = rateHomeForm.getRateId();
			String content = rateHomeForm.getContent();
			Log.in(content);
			Log.in(email + " " + password + " " + rateId + " " + accountId);
			if (loginBO.checkLogin(new Login(email, password)) == true) {
				if (rateBO.update(rateId, accountId, content) == true) {
					String json = "success";
					out.print(json);
				} else {
					String json = "failed";
					out.print(json);
				}
			} else {
				String json = gson.toJson(rates);
				out.print(json);
			}
		} else if (action.equals("get")) {
			HttpSession httpSession = request.getSession();
			String email = (String) httpSession.getAttribute("email");
			String password = (String) httpSession.getAttribute("password");
			int accountId = 0;
			try {
				accountId = (Integer) httpSession.getAttribute("accountId");
			} catch (Exception e) {
			}
			int rateId = rateHomeForm.getRateId();
			rates = rateBO.getListByThread(thread, accountId);
			String json = gson.toJson(rates);
			out.print(json);
		}
		out.flush();
		return null;
	}
}
