package action.admin.account;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import com.google.gson.Gson;

import common.StringProcess;
import form.admin.account.AccountForm;
import model.bean.Account;
import model.bo.AccountBO;
import model.bo.CategoryBO;
import statics.Log;

public class EditAccountAction extends Action {
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
		
		request.setCharacterEncoding("UTF-8");

		// Tương tác dữ liệu từ form
		AccountForm accountForm = (AccountForm) form;

		// Tương tác với csdl
		CategoryBO categoryBO = new CategoryBO();
		
		accountForm.setCategories(categoryBO.getList());

		// Tạo ra đối tượng account với dữ liệu từ form
		account = new Account(accountForm.getAccountId(), accountForm.getLevel(), accountForm.getCategoryId(),
				accountForm.getName(), accountForm.getEmail(), accountForm.getPassword(), accountForm.getPhone(),
				accountForm.getStatus());

		// Lưu lại hành động từ form
		String action = action = accountForm.getAction();

		if ("submit".equals(action)) {

			accountBO.editAccount(account);

			// Sửa thành công và chuyển trang
			return mapping.findForward("editedAccount");

		} else {

			accountData = accountBO.getAccountById(account);
			accountForm.setAccountId(accountData.getAccountId());
			accountForm.setLevel(accountData.getLevel());
			accountForm.setCategoryId(accountData.getCategoryId());
			accountForm.setName(accountData.getName());
			accountForm.setEmail(accountData.getEmail());
			accountForm.setPhone(accountData.getPhone());
			accountForm.setStatus(accountData.getStatus());
			return mapping.findForward("editAccount");

		}

	}
}
