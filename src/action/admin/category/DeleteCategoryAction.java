package action.admin.category;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import form.admin.account.AccountListForm;
import form.admin.account.DeleteForm;
import form.admin.category.DeleteCategoryForm;
import model.bean.Account;
import model.bean.Category;
import model.bo.AccountBO;
import model.bo.CategoryBO;
import statics.Log;
import statics.Pagination;

public class DeleteCategoryAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// Tương tác dữ liệu từ form
		DeleteCategoryForm deleteCategoryForm = (DeleteCategoryForm) form;

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

		// Tương tác với csdl
		CategoryBO categoryBO = new CategoryBO();

		int categoryId = 0;
		try {
			categoryId = deleteCategoryForm.getCategoryId();
		} catch (Exception e) {
			// TODO: handle exception
		}
		// Tạo ra đối tượng account
		Category category = new Category(categoryId, "");

		// Gán giá trị accountId

		if (categoryId >= 0)
			categoryBO.delete(category);

		// Trả v�? deletedAccount
		return mapping.findForward("success");
	}
}
