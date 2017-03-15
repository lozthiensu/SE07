package model.bo;

import java.util.ArrayList;

import model.bean.District;
import model.bean.Province;
import model.dao.DistrictDAO;

public class DistrictBO {
	DistrictDAO districtDAO = new DistrictDAO();

	public ArrayList<District> getList(Province province) {
		return districtDAO.getList(province);
	}

}
