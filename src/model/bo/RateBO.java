package model.bo;

import java.util.ArrayList;

import model.bean.Account;
import model.bean.Rate;
import model.bean.Thread;
import model.dao.RateDAO;

public class RateBO {
	RateDAO rateDAO = new RateDAO();

	public ArrayList<Rate> getListByThread(Thread thread, int accountId) {
		return rateDAO.getListByThread(thread, accountId);
	}

	public int addRate(Rate rate) {
		return rateDAO.addRate(rate);
	}

	public boolean delete(int rateId, int accountId) {
		// TODO Auto-generated method stub
		return rateDAO.delete(rateId, accountId);
	}

	public boolean update(int rateId, int accountId, String content) {
		return rateDAO.update(rateId, accountId, content);
	}
	public ArrayList<Rate> getListByAccount(Account account, int page) {
		return rateDAO.getListByAccount(account, page);
	}
}
