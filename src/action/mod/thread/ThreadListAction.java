package action.mod.thread;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import form.user.thread.ThreadListForm;
import model.bean.Account;
import model.bean.Thread;
import model.bo.AccountBO;
import model.bo.ThreadBO;
import statics.Log;

public class ThreadListAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ThreadListForm threadListForm = (ThreadListForm) form;

		/* START CHECK LOGIN */
		Account account = new Account();
		AccountBO accountBO = new AccountBO();
		ThreadBO threadBO = new ThreadBO();
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

		int page = threadListForm.getPage();
		ArrayList<Thread> threads = new ArrayList<Thread>();
		threads = threadBO.getListByAccountMod(accountData, page);
		threadListForm.setThreads(threads);
		try {
			if (threads.get(0).getTotal() > 0)
				threadListForm.setTotalPage(threads.get(0).getTotal());
		} catch (Exception e) {
			threadListForm.setTotalPage(0);
		}

		return mapping.findForward("success");

	}
}
