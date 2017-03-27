package form.admin;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.DashBoard;

public class DashBoardForm extends ActionForm {
	DashBoard dashBoard;

	public DashBoardForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DashBoardForm(DashBoard dashBoard) {
		this.dashBoard = dashBoard;
	}

	public DashBoard getDashBoard() {
		return dashBoard;
	}

	public void setDashBoard(DashBoard dashBoard) {
		this.dashBoard = dashBoard;
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}
