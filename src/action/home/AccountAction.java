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
import form.home.SearchThreadForm;
import model.bean.Account;
import model.bean.Login;
import model.bean.Notification;
import model.bean.Thread;
import model.bo.AccountBO;
import model.bo.LoginBO;
import model.bo.NotificationBO;
import model.bo.ThreadBO;
import statics.Log;

public class AccountAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		AccountHomeForm accountHomeForm = (AccountHomeForm) form;

		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");
		PrintWriter out = response.getWriter();

		Account account = new Account();
		AccountBO accountBO = new AccountBO();
		LoginBO loginBO = new LoginBO();
		NotificationBO notificationBO = new NotificationBO();

		account.setEmail(accountHomeForm.getEmail());
		account.setPassword(accountHomeForm.getPassword());
		String action = accountHomeForm.getAction();
		if (action.equals("register")) {
			if (accountBO.addAccount(account) == true) {
				out.print("success");
			} else {
				out.print("failed");
			}
		} else if (action.equals("getNotification")) {
			HttpSession httpSession = request.getSession();
			String email = (String) httpSession.getAttribute("email");
			String password = (String) httpSession.getAttribute("password");

			int accountId = 0;
			try {
				accountId = (Integer) httpSession.getAttribute("accountId");
			} catch (Exception e) {
			}

			Gson gson = new Gson();
			ArrayList<Notification> notifications = new ArrayList<Notification>();
			if (loginBO.checkLogin(new Login(email, password)) == true) {
				notifications = notificationBO.getListByAccount(accountId);
				String json = gson.toJson(notifications);
				out.print(json);
			} else {
				String json = gson.toJson(notifications);
				out.print(json);
			}
		} else if (action.equals("read")) {
			HttpSession httpSession = request.getSession();
			String email = (String) httpSession.getAttribute("email");
			String password = (String) httpSession.getAttribute("password");

			int accountId = 0;
			int notificationId = 0;
			try {
				accountId = (Integer) httpSession.getAttribute("accountId");
				notificationId = accountHomeForm.getNotificationId();
			} catch (Exception e) {
			}
			Gson gson = new Gson();
			ArrayList<Notification> notifications = new ArrayList<Notification>();
			if (loginBO.checkLogin(new Login(email, password)) == true) {
				if (notificationBO.read(notificationId, accountId) == true) {
					out.print("success");
				} else {
					out.print("failed");
				}
			} else {
				out.print("failed");
			}
		} else if (action.equals("login")) {
			Account accountData = accountBO.checkLoginAccount(account);
			if (accountData.getAccountId() > 0) {
				Gson gson = new Gson();
				String json = gson.toJson(accountData);
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("email", accountData.getEmail());
				httpSession.setAttribute("password", accountData.getPassword());
				httpSession.setAttribute("accountId", accountData.getAccountId());
				accountData.setPassword("");
				Log.in(json);
				out.print(json);
			} else {
				Gson gson = new Gson();
				String json = gson.toJson(accountData);
				out.print(json);
			}
		} else if (action.equals("logout")) {
			HttpSession httpSession = request.getSession();
			httpSession.invalidate();
		} else if (action.equals("checkEmail")) {
			if (accountBO.checkEmail(account) == true) {
				out.print("success");
			} else {
				out.print("failed");
			}
		}

		out.flush();
		return null;
	}
}
