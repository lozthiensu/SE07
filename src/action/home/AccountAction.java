package action.home;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		PrintWriter out = response.getWriter();

		Account account = new Account();
		AccountBO accountBO = new AccountBO();

		account.setEmail(accountHomeForm.getEmail());
		account.setPassword(accountHomeForm.getPassword());
		String action = accountHomeForm.getAction();
		Gson gson = null;
		if (action.equals("register")) {
			if(accountBO.addAccount(account) == true){
				out.print("success");
				Log.in("thanh cong");
			}else {
				out.print("failed");
				Log.in("thanh bai");
			}
		} else if (action.equals("login")) {
			int accountId = accountBO.checkLogin(account);
			if( accountId > 0){
				Log.in(accountId);
				out.print(accountId);
			}else {
				out.print("-1");
			}
		} else if (action.equals("checkEmail")) {
			if(accountBO.checkEmail(account) == true){
				out.print("success");
			}else {
				out.print("failed");
			}
		}
		out.flush();
		return null;
	}
}
