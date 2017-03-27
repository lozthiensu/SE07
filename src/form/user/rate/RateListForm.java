package form.user.rate;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Rate;

public class RateListForm extends ActionForm {
	int page = 1;
	int totalPage = 1;
	ArrayList<Rate> rates;

	public RateListForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RateListForm(int page, int totalPage, ArrayList<Rate> rates) {
		this.page = page;
		this.totalPage = totalPage;
		this.rates = rates;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public ArrayList<Rate> getRates() {
		return rates;
	}

	public void setRates(ArrayList<Rate> rates) {
		this.rates = rates;
	}

}
