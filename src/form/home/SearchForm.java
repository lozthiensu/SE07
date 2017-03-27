package form.home;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Category;
import model.bean.District;
import model.bean.Province;
import model.bean.Village;

public class SearchForm extends ActionForm {
	ArrayList<Category> categories;
	ArrayList<Province> provinces;
	ArrayList<District> districts;
	ArrayList<Village> villages;
	int provinceId;
	int districtId;
	int villageId;
	int categoryId;

	public SearchForm() {
		super();
	}

	public SearchForm(ArrayList<Category> categories) {
		super();
		this.categories = categories;
	}

	public int getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}

	public int getDistrictId() {
		return districtId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}

	public int getVillageId() {
		return villageId;
	}

	public void setVillageId(int villageId) {
		this.villageId = villageId;
	}

	public ArrayList<Province> getProvinces() {
		return provinces;
	}

	public void setProvinces(ArrayList<Province> provinces) {
		this.provinces = provinces;
	}

	public ArrayList<District> getDistricts() {
		return districts;
	}

	public void setDistricts(ArrayList<District> districts) {
		this.districts = districts;
	}

	public ArrayList<Village> getVillages() {
		return villages;
	}

	public void setVillages(ArrayList<Village> villages) {
		this.villages = villages;
	}

	public ArrayList<Category> getCategories() {
		return categories;
	}

	public void setCategories(ArrayList<Category> categories) {
		this.categories = categories;
	}

}
