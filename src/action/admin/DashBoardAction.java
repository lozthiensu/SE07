package action.admin;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import form.admin.DashBoardForm;
import model.bean.Account;
import model.bean.DashBoard;
import model.bo.AccountBO;
import model.bo.DashBoardBO;
import statics.Log;

public class DashBoardAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response)
			throws Exception { /* START CHECK LOGIN */
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
		DashBoardForm dashBoardForm = (DashBoardForm) form;
		DashBoardBO dashBoardBO = new DashBoardBO();
		DashBoard dashBoard = new DashBoard();
		dashBoard = dashBoardBO.get();
		Gson gson = new Gson();
		dashBoard.setJsonThread(gson.toJson(dashBoard.getChartThread()));
		dashBoard.setJsonRate(gson.toJson(dashBoard.getChartRate()));

		dashBoardForm.setDashBoard(dashBoard);
		
		return mapping.findForward("success");

	}
}
