package action.user.thread;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import form.admin.account.DeleteForm;
import form.user.thread.DeleteThreadForm;
import model.bean.Account;
import model.bean.Thread;
import model.bo.AccountBO;
import model.bo.ThreadBO;
import statics.Log;

public class DeleteThreadAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		
		Account account = new Account();
		AccountBO accountBO = new AccountBO(); 
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
			//Log.in(accountData.toString());
			Gson gson = new Gson();
			String json = gson.toJson(accountData);
			httpSession.setAttribute("email", accountData.getEmail());
			httpSession.setAttribute("password", accountData.getPassword());
			accountData.setPassword("");
		} else {
			return mapping.findForward("failed");
		}	
		
		
		DeleteThreadForm deleteThreadForm = (DeleteThreadForm) form;

		ThreadBO threadBO = new ThreadBO();

		int threadId = deleteThreadForm.getThreadId();

		Thread thread = new Thread();
		thread.setThreadId(threadId);

		thread = threadBO.getById(thread);
		if(thread.getAccountId() != accountData.getAccountId()){
			Log.in("Bai viet khong thuoc quyen cua ban");
			Log.in(thread.toString());
			Log.in(accountData.toString());
			return mapping.findForward("failed");
		}
		
		
		Log.in(thread.toString());
		
		if (threadBO.delete(thread) == true) {
			Log.in("Da xoa");
			return mapping.findForward("deleted");
		} else {
			Log.in("Khong xoa");
			return mapping.findForward("failed");
		}
	}
}
