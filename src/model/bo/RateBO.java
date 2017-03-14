package model.bo;

import java.util.ArrayList;

import model.bean.Rate;
import model.bean.Thread;
import model.dao.RateDAO;

public class RateBO {
	RateDAO rateDAO = new RateDAO();

	public ArrayList<Rate> getListByThread(Thread thread) {
		return rateDAO.getListByThread(thread);
	}

	public boolean addRate(Rate rate) {
		return rateDAO.addRate(rate);
	}
}
