package model.bo;

import java.util.ArrayList;

import model.bean.Province;
import model.dao.ProvinceDAO;

public class ProvinceBO {
	ProvinceDAO provinceDAO = new ProvinceDAO();
	
	public ArrayList<Province> getList(){
		return provinceDAO.getList();
	}
}
