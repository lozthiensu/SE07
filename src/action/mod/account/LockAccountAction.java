package action.mod.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import form.admin.account.DeleteForm;
import form.mod.account.ModAccountForm;
import form.mod.thread.VerifyThreadForm;
import form.user.thread.DeleteThreadForm;
import model.bean.Account;
import model.bean.Thread;
import model.bo.AccountBO;
import model.bo.ThreadBO;
import statics.Log;

public class LockAccountAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		/* START CHECK LOGIN */
		Account account = new Account();
		AccountBO accountBO = new AccountBO();
		HttpSession httpSession = request.getSession();
		try {
			account.setEmail(httpSession.getAttribute("emailMod").toString());
			account.setPassword(httpSession.getAttribute("passwordMod").toString());
		} catch (Exception e) {
			return mapping.findForward("failed");
		}
		Account accountData = accountBO.checkLoginAccountMod(account);
		if (accountData.getAccountId() > 0) {
			Gson gson = new Gson();
			String json = gson.toJson(accountData);
			httpSession.setAttribute("emailMod", accountData.getEmail());
			httpSession.setAttribute("passwordMod", accountData.getPassword());
			accountData.setPassword("");
		} else {
			return mapping.findForward("failed");
		}
		/* END CHECK LOGIN */

		ModAccountForm modAccountForm = (ModAccountForm) form;
		ThreadBO threadBO = new ThreadBO();
		int accountId = modAccountForm.getAccountId();
		Account accountLock = new Account();
		accountLock.setAccountId(accountId);
		accountLock = accountBO.getAccountById(accountLock);

		// Check thread owner
		if (accountLock.getLevel() != 3) {
			return mapping.findForward("failed");
		}

		// Lock
		if (accountBO.lock(accountLock) == true) {
			return mapping.findForward("success");
		} else {
			return mapping.findForward("failed");
		}
	}
}
