package model.bo;

import java.util.ArrayList;

import model.bean.District;
import model.bean.Village;
import model.dao.VillageDAO;

public class VillageBO {
	VillageDAO villageDAO = new VillageDAO();

	public ArrayList<Village> getList(District district) {
		return villageDAO.getList(district);
	}

}
