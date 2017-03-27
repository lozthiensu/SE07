package model.bo;

import model.bean.DashBoard;
import model.dao.DashBoardDAO;

public class DashBoardBO {
	DashBoardDAO dashBoardDAO = new DashBoardDAO();

	public DashBoard get() {
		return dashBoardDAO.get();
	}

}
