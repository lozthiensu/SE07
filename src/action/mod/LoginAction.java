package action.mod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.admin.LoginForm;
import model.bean.Account;
import model.bo.AccountBO;
import statics.Log;

public class LoginAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		LoginForm loginFormMod = (LoginForm) form;

		AccountBO accountBO = new AccountBO();

		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");

		/* START CHECK LOGIN */
		Account account = new Account();
		HttpSession httpSession = request.getSession();
		try {
			account.setEmail(loginFormMod.getEmail());
			account.setPassword(loginFormMod.getPassword());
		} catch (Exception e) {
			return mapping.findForward("failed");
		}
		Account accountData = accountBO.checkLoginAccountMod(account);
		if (accountData.getAccountId() > 0) {
			httpSession.setAttribute("emailMod", accountData.getEmail());
			httpSession.setAttribute("passwordMod", accountData.getPassword());
			response.addCookie(new Cookie("emailMod", accountData.getEmail()));
			response.addCookie(new Cookie("avatarMod", accountData.getAvatar()));

			accountData.setPassword("");
			return mapping.findForward("success");
		} else {
			loginFormMod.setNotification("Đăng nhập thất bại");
			return mapping.findForward("failed");
		}
	}
}
