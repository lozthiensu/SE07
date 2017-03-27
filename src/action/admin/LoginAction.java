package action.admin;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Account;
import model.bean.Login;
import model.bo.AccountBO;
import model.bo.LoginBO;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.admin.LoginForm;;

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
		Account accountData = accountBO.checkLoginAccountAdmin(account);
		if (accountData.getAccountId() > 0) {
			httpSession.setAttribute("emailAdmin", accountData.getEmail());
			httpSession.setAttribute("passwordAdmin", accountData.getPassword());
			response.addCookie(new Cookie("emailAdmin", accountData.getEmail()));
			response.addCookie(new Cookie("avatarAdmin", accountData.getAvatar()));

			accountData.setPassword("");
			return mapping.findForward("success");
		} else {
			loginFormMod.setNotification("Đăng nhập thất bại");
			return mapping.findForward("failed");
		}
	}
}
