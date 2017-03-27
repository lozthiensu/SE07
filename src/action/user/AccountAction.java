package action.user;

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
import model.bean.Thread;
import model.bo.AccountBO;
import model.bo.ThreadBO;
import statics.Log;

public class AccountAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		AccountHomeForm accountHomeForm = (AccountHomeForm) form;

		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");
		
		/* BAT DAU KIEM TRA DANG NHAP */
				
		Account account = new Account();
		AccountBO accountBO = new AccountBO();
		HttpSession httpSession = request.getSession();
		try {
			account.setEmail(httpSession.getAttribute("email").toString());
			account.setPassword(httpSession.getAttribute("password").toString());
		} catch (Exception e) {
			return mapping.findForward("failed");
		}
		Account accountData = accountBO.checkLoginAccount(account);
		if (accountData.getAccountId() > 0) {
			Gson gson = new Gson();
			String json = gson.toJson(accountData);
			httpSession.setAttribute("email", accountData.getEmail());
			httpSession.setAttribute("password", accountData.getPassword());
			accountData.setPassword("");
			return mapping.findForward("success");
		} else {
			return mapping.findForward("failed");
		} 
		/* KET THUC KIEM TRA DANG NHAP */
		
	}
}
