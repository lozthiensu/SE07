package model.bean;

public class Thread {
	int threadId;
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
	String waterSourceString;
	String direction;
	int numOfToilets;
	int numOfPeople;
	int object;
	int villageId;
	Province province;
	District district;
	Village village;
	boolean kindOf;

	int provinceId;
	int districtId;

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
	String categoryName;
	String avatar;
	String phone;
	String email;

	public Thread() {
		super();
	}

	public Thread(int threadId, int categoryId, int accountId, String name, String address, double latitude,
			double longitude, String content, long price, int electricFee, int waterFee, int otherFee, int area,
			boolean wifi, boolean waterHeater, boolean conditioner, boolean fridge, boolean attic, boolean camera,
			int waterSource, String direction, int numOfToilets, int numOfPeople, int object, int villageId,
			String created, int viewed, int status, String imageThumb) {
		super();
		this.threadId = threadId;
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
		this.created = created;
		this.viewed = viewed;
		this.status = status;
		this.imageThumb = imageThumb;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getWaterSourceString() {
		return waterSourceString;
	}

	public void setWaterSourceString(String waterSourceString) {
		this.waterSourceString = waterSourceString;
	}

	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}

	public int getRateNum() {
		return rateNum;
	}

	public boolean isKindOf() {
		return kindOf;
	}

	public void setKindOf(boolean kindOf) {
		this.kindOf = kindOf;
	}

	public void setRateNum(int rateNum) {
		this.rateNum = rateNum;
	}

	public int getThreadId() {
		return threadId;
	}

	public void setThreadId(int threadId) {
		this.threadId = threadId;
	}

	public int getCategoryId() {
		return categoryId;
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

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getFar() {
		return far;
	}

	public void setFar(int far) {
		this.far = far;
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

	public boolean isOld() {
		return old;
	}

	public void setOld(boolean old) {
		this.old = old;
	}

	public void setTotal(int total) {
		this.total = total;
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

	@Override
	public String toString() {
		return "Thread [threadId=" + threadId + ", rateNum=" + rateNum + ", categoryId=" + categoryId + ", accountId="
				+ accountId + ", name=" + name + ", address=" + address + ", latitude=" + latitude + ", longitude="
				+ longitude + ", content=" + content + ", price=" + price + ", electricFee=" + electricFee
				+ ", waterFee=" + waterFee + ", otherFee=" + otherFee + ", area=" + area + ", wifi=" + wifi
				+ ", waterHeater=" + waterHeater + ", conditioner=" + conditioner + ", fridge=" + fridge + ", attic="
				+ attic + ", camera=" + camera + ", waterSource=" + waterSource + ", direction=" + direction
				+ ", numOfToilets=" + numOfToilets + ", numOfPeople=" + numOfPeople + ", object=" + object
				+ ", villageId=" + villageId + ", province=" + province + ", district=" + district + ", village="
				+ village + ", provinceId=" + provinceId + ", districtId=" + districtId + ", created=" + created
				+ ", viewed=" + viewed + ", status=" + status + ", imageThumb=" + imageThumb + ", priceString="
				+ priceString + ", avgScore=" + avgScore + ", avgScoreInt=" + avgScoreInt + ", total=" + total
				+ ", far=" + far + ", page=" + page + ", totalPage=" + totalPage + ", old=" + old + ", categoryName="
				+ categoryName + "]";
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

}
