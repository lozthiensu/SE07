package action.admin.account;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import form.admin.LoginForm;
import form.admin.account.AccountListForm;
import model.bean.Account;
import model.bo.AccountBO;
import model.bo.LoginBO;
import statics.Log;
import statics.Pagination;

public class AccountListAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		/* START CHECK LOGIN */
		Account account = new Account();
		AccountBO accountBO = new AccountBO();
		HttpSession httpSession = request.getSession();

		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");

		try {
			account.setEmail(httpSession.getAttribute("emailAdmin").toString());
			account.setPassword(httpSession.getAttribute("passwordAdmin").toString());
		} catch (Exception e) {
			return mapping.findForward("failed");
		}
		Account accountData = accountBO.checkLoginAccountAdmin(account);
		if (accountData.getAccountId() > 0) {
			Gson gson = new Gson();
			String json = gson.toJson(accountData);
			httpSession.setAttribute("emailAdmin", accountData.getEmail());
			httpSession.setAttribute("passwordAdmin", accountData.getPassword());
			response.addCookie(new Cookie("emailAdmin", accountData.getEmail()));
			response.addCookie(new Cookie("avatarAdmin", accountData.getAvatar()));
			accountData.setPassword("");
		} else {
			return mapping.findForward("failed");
		}
		/* END CHECK LOGIN */
		
		// accountListForm tương tác dữ liệu từ form
		AccountListForm accountListForm = (AccountListForm) form;

		// accountBO để tương tác vs csdl

		// Lấy số trang cần xem
		int page = accountListForm.getPage();

		// Lấy danh sách account từ csdl và lưu vào accounts
		ArrayList<Account> accounts = accountBO.getListAccount(page);

		// Gán accounts lên form
		accountListForm.setAccounts(accounts);

		// Gán số trang hiện tại lên form
		accountListForm.setPage(Pagination.page);

		// Gán tổng số trang lên form
		accountListForm.setTotalPage(Pagination.totalPage);

		// Trả v�? trang listAccounts
		return mapping.findForward("listAccounts");
	}
}
