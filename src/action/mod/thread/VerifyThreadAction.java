package action.mod.thread;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import form.admin.account.DeleteForm;
import form.mod.thread.VerifyThreadForm;
import form.user.thread.DeleteThreadForm;
import model.bean.Account;
import model.bean.Thread;
import model.bo.AccountBO;
import model.bo.ThreadBO;
import statics.Log;

public class VerifyThreadAction extends Action {
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

		VerifyThreadForm verifyThreadForm = (VerifyThreadForm) form;
		ThreadBO threadBO = new ThreadBO();
		int threadId = verifyThreadForm.getThreadId();
		Thread thread = new Thread();
		thread.setThreadId(threadId);
		thread = threadBO.getById(thread);

		// Check thread owner
		if (thread.getCategoryId() != accountData.getCategoryId()) {
			return mapping.findForward("failed");
		}

		// Delete
		if (threadBO.verify(thread) == true) {
			return mapping.findForward("success");
		} else {
			return mapping.findForward("failed");
		}
	}
}
