package form.user.thread;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.Category;
import model.bean.District;
import model.bean.Province;
import model.bean.Thread;
import model.bean.Village;

public class ThreadForm extends ActionForm {
	int threadId;
	String action;

	int rateNum;
	int categoryId;
	int accountId;
	String name;
	String address;
	double latitude;
	double longitude;
	String content;
	long price;
	int electricFee;
	int waterFee;
	int otherFee;
	int area;
	boolean wifi;
	boolean waterHeater;
	boolean conditioner;
	boolean fridge;
	boolean attic;
	boolean camera;
	int waterSource;
	String direction;
	int numOfToilets;
	int numOfPeople;
	int object;
	int villageId;
	Province province;
	District district;
	Village village;

	boolean kindOf;
	String created;
	int viewed;
	int status;
	String imageThumb;
	String priceString;
	float avgScore;
	int avgScoreInt;
	int total;
	int far;
	int page;
	int totalPage;
	boolean old;
	int provinceId;
	int districtId;
	String categoryName;
	ArrayList<Category> categories;
	ArrayList<Province> provinces;
	ArrayList<District> districts;
	ArrayList<Village> villages;
	String imagesString;

	public ThreadForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ThreadForm(int threadId, String action, int rateNum, int categoryId, int accountId, String name,
			String address, double latitude, double longitude, String content, long price, int electricFee,
			int waterFee, int otherFee, int area, boolean wifi, boolean waterHeater, boolean conditioner,
			boolean fridge, boolean attic, boolean camera, int waterSource, String direction, int numOfToilets,
			int numOfPeople, int object, int villageId, Province province, District district, Village village,
			String created, int viewed, int status, String imageThumb, String priceString, float avgScore,
			int avgScoreInt, int total, int far, int page, int totalPage, boolean old, String categoryName,
			ArrayList<Category> categories, ArrayList<Province> provinces, ArrayList<District> districts,
			ArrayList<Village> villages) {
		super();
		this.threadId = threadId;
		this.action = action;
		this.rateNum = rateNum;
		this.categoryId = categoryId;
		this.accountId = accountId;
		this.name = name;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
		this.content = content;
		this.price = price;
		this.electricFee = electricFee;
		this.waterFee = waterFee;
		this.otherFee = otherFee;
		this.area = area;
		this.wifi = wifi;
		this.waterHeater = waterHeater;
		this.conditioner = conditioner;
		this.fridge = fridge;
		this.attic = attic;
		this.camera = camera;
		this.waterSource = waterSource;
		this.direction = direction;
		this.numOfToilets = numOfToilets;
		this.numOfPeople = numOfPeople;
		this.object = object;
		this.villageId = villageId;
		this.province = province;
		this.district = district;
		this.village = village;
		this.created = created;
		this.viewed = viewed;
		this.status = status;
		this.imageThumb = imageThumb;
		this.priceString = priceString;
		this.avgScore = avgScore;
		this.avgScoreInt = avgScoreInt;
		this.total = total;
		this.far = far;
		this.page = page;
		this.totalPage = totalPage;
		this.old = old;
		this.categoryName = categoryName;
		this.categories = categories;
		this.provinces = provinces;
		this.districts = districts;
		this.villages = villages;
	}

	public String getImagesString() {
		return imagesString;
	}

	public void setImagesString(String imagesString) {
		this.imagesString = imagesString;
	}

	public int getThreadId() {
		return threadId;
	}

	public boolean isKindOf() {
		return kindOf;
	}

	public void setKindOf(boolean kindOf) {
		this.kindOf = kindOf;
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

	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}

	public void setThreadId(int threadId) {
		this.threadId = threadId;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public int getRateNum() {
		return rateNum;
	}

	public void setRateNum(int rateNum) {
		this.rateNum = rateNum;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public int getElectricFee() {
		return electricFee;
	}

	public void setElectricFee(int electricFee) {
		this.electricFee = electricFee;
	}

	public int getWaterFee() {
		return waterFee;
	}

	public void setWaterFee(int waterFee) {
		this.waterFee = waterFee;
	}

	public int getOtherFee() {
		return otherFee;
	}

	public void setOtherFee(int otherFee) {
		this.otherFee = otherFee;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public boolean isWifi() {
		return wifi;
	}

	public void setWifi(boolean wifi) {
		this.wifi = wifi;
	}

	public boolean isWaterHeater() {
		return waterHeater;
	}

	public void setWaterHeater(boolean waterHeater) {
		this.waterHeater = waterHeater;
	}

	public boolean isConditioner() {
		return conditioner;
	}

	public void setConditioner(boolean conditioner) {
		this.conditioner = conditioner;
	}

	public boolean isFridge() {
		return fridge;
	}

	public void setFridge(boolean fridge) {
		this.fridge = fridge;
	}

	public boolean isAttic() {
		return attic;
	}

	public void setAttic(boolean attic) {
		this.attic = attic;
	}

	public boolean isCamera() {
		return camera;
	}

	public void setCamera(boolean camera) {
		this.camera = camera;
	}

	public int getWaterSource() {
		return waterSource;
	}

	public void setWaterSource(int waterSource) {
		this.waterSource = waterSource;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public int getNumOfToilets() {
		return numOfToilets;
	}

	public void setNumOfToilets(int numOfToilets) {
		this.numOfToilets = numOfToilets;
	}

	public int getNumOfPeople() {
		return numOfPeople;
	}

	public void setNumOfPeople(int numOfPeople) {
		this.numOfPeople = numOfPeople;
	}

	public int getObject() {
		return object;
	}

	public void setObject(int object) {
		this.object = object;
	}

	public int getVillageId() {
		return villageId;
	}

	public void setVillageId(int villageId) {
		this.villageId = villageId;
	}

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public Village getVillage() {
		return village;
	}

	public void setVillage(Village village) {
		this.village = village;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public int getViewed() {
		return viewed;
	}

	public void setViewed(int viewed) {
		this.viewed = viewed;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getImageThumb() {
		return imageThumb;
	}

	public void setImageThumb(String imageThumb) {
		this.imageThumb = imageThumb;
	}

	public String getPriceString() {
		return priceString;
	}

	public void setPriceString(String priceString) {
		this.priceString = priceString;
	}

	public float getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(float avgScore) {
		this.avgScore = avgScore;
	}

	public int getAvgScoreInt() {
		return avgScoreInt;
	}

	public void setAvgScoreInt(int avgScoreInt) {
		this.avgScoreInt = avgScoreInt;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getFar() {
		return far;
	}

	public void setFar(int far) {
		this.far = far;
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

	public boolean isOld() {
		return old;
	}

	public void setOld(boolean old) {
		this.old = old;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public ArrayList<Category> getCategories() {
		return categories;
	}

	public void setCategories(ArrayList<Category> categories) {
		this.categories = categories;
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

	@Override
	public String toString() {
		return "ThreadForm [threadId=" + threadId + ", action=" + action + ", rateNum=" + rateNum + ", categoryId="
				+ categoryId + ", accountId=" + accountId + ", name=" + name + ", address=" + address + ", latitude="
				+ latitude + ", longitude=" + longitude + ", content=" + content + ", price=" + price + ", electricFee="
				+ electricFee + ", waterFee=" + waterFee + ", otherFee=" + otherFee + ", area=" + area + ", wifi="
				+ wifi + ", waterHeater=" + waterHeater + ", conditioner=" + conditioner + ", fridge=" + fridge
				+ ", attic=" + attic + ", camera=" + camera + ", waterSource=" + waterSource + ", direction="
				+ direction + ", numOfToilets=" + numOfToilets + ", numOfPeople=" + numOfPeople + ", object=" + object
				+ ", villageId=" + villageId + ", province=" + province + ", district=" + district + ", village="
				+ village + ", kindOf=" + kindOf + ", created=" + created + ", viewed=" + viewed + ", status=" + status
				+ ", imageThumb=" + imageThumb + ", priceString=" + priceString + ", avgScore=" + avgScore
				+ ", avgScoreInt=" + avgScoreInt + ", total=" + total + ", far=" + far + ", page=" + page
				+ ", totalPage=" + totalPage + ", old=" + old + ", provinceId=" + provinceId + ", districtId="
				+ districtId + ", categoryName=" + categoryName + ", categories=" + categories + ", provinces="
				+ provinces + ", districts=" + districts + ", villages=" + villages + "]";
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
