package action.home;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.home.SearchForm;
import model.bean.Category;
import model.bean.Province;
import model.bean.Thread;
import model.bo.CategoryBO;
import model.bo.ProvinceBO;
import model.bo.ThreadBO;
import statics.Log;

public class SearchAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception { 

		SearchForm searchForm = (SearchForm) form;
		
		// Khai bao doi tuong BO cua category
		CategoryBO categoryBO = new CategoryBO();
		ProvinceBO provinceBO = new ProvinceBO();

		ArrayList<Category> categories = new ArrayList<Category>();
		ArrayList<Province> provinces = new ArrayList<Province>();

		// Tao ra doi tuong category tu form
		categories = categoryBO.getList();
		provinces = provinceBO.getList(); 
		searchForm.setCategories(categories);
		searchForm.setProvinces(provinces);
		
		return mapping.findForward("search");
	}
}
