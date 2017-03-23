package action.user.thread;

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

		Account account = new Account();
		AccountBO accountBO = new AccountBO();
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
		int page = threadListForm.getPage();

		ArrayList<Thread> threads = new ArrayList<Thread>();
		threads = threadBO.getListByAccount(accountData, page);
		threadListForm.setThreads(threads);
		try {
			Log.in(threads.get(0).getTotal() + " totalPage");
			if (threads.get(0).getTotal() > 0)
				threadListForm.setTotalPage(threads.get(0).getTotal());
		} catch (Exception e) {
			threadListForm.setTotalPage(0);
		}

		return mapping.findForward("success");

	}
}
