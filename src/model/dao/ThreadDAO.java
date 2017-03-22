package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;

import form.user.thread.ThreadForm;
import model.bean.Account;
import model.bean.Category;
import model.bean.District;
import model.bean.Province;
import model.bean.Thread;
import model.bean.Village;
import statics.Check;
import statics.InfoSQLServer;
import statics.Log;
import statics.Pagination;

public class ThreadDAO {

	// Khai báo các biến để kết nối vs csdl, lưu tại class InfoSQLServer
	String url = InfoSQLServer.url;
	String userName = InfoSQLServer.userName;
	String password = InfoSQLServer.password;
	Connection connection;

	void connect() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager.getConnection(url, userName, password);
			System.out.println("Ket noi thanh cong");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Ket noi loi");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("JDBC loi");
		}
	}

	// Lấy danh sách danh mục
	public ArrayList<model.bean.Thread> getList() {
		// Mở kết nối
		connect();

		// Biến lưu kết quả từ truy vấn
		ResultSet rs = null;

		// Lưu danh sách account từ csdl
		ArrayList<model.bean.Thread> temp = new ArrayList<Thread>();

		try {

			// Câu lệnh đếm có bao nhiêu dòng trong csdl
			String sql = "select Thread.* from Thread";
			PreparedStatement pr = connection.prepareStatement(sql);
			rs = pr.executeQuery();

			try {
				DecimalFormat numberFormat = new DecimalFormat("#.##");
				while (rs.next()) {
					Thread threadTemp = new Thread(rs.getInt("threadId"), rs.getInt("categoryId"),
							rs.getInt("accountId"), rs.getString("name"), rs.getString("address"),
							rs.getDouble("latitude"), rs.getDouble("longitude"), rs.getString("content"),
							rs.getLong("price"), rs.getInt("electricFee"), rs.getInt("waterFee"), rs.getInt("otherFee"),
							rs.getInt("area"), rs.getBoolean("wifi"), rs.getBoolean("waterHeater"),
							rs.getBoolean("conditioner"), rs.getBoolean("fridge"), rs.getBoolean("attic"),
							rs.getBoolean("camera"), rs.getInt("waterSource"), rs.getString("direction"),
							rs.getInt("numOfToilets"), rs.getInt("numOfPeople"), rs.getInt("object"),
							rs.getInt("villageId"), rs.getString("created"), rs.getInt("viewed"), rs.getInt("status"),
							rs.getString("imageThumb"));
					if (threadTemp.getPrice() >= 1000000) {
						threadTemp.setPriceString(
								numberFormat.format(((double) (threadTemp.getPrice() / (1.0 * 1000000)))) + " triệu ");
					} else if (threadTemp.getPrice() > 1000) {
						threadTemp.setPriceString((threadTemp.getPrice() / 1000) + " ngàn ");
					}
					temp.add(threadTemp);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			// Đóng kết nối
			pr.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// Trả về kết quả
		return temp;
	}

	// Lấy danh sách danh mục
	public ArrayList<model.bean.Thread> getListMostView() {
		// Mở kết nối
		connect();

		// Biến lưu kết quả từ truy vấn
		ResultSet rs = null;

		// Lưu danh sách account từ csdl
		ArrayList<model.bean.Thread> temp = new ArrayList<Thread>();

		try {

			// Câu lệnh đếm có bao nhiêu dòng trong csdl
			String sql = "SELECT top 4 * FROM Thread order by viewed desc";
			PreparedStatement pr = connection.prepareStatement(sql);
			rs = pr.executeQuery();

			try {
				DecimalFormat numberFormat = new DecimalFormat("#.##");
				while (rs.next()) {
					Thread threadTemp = new Thread(rs.getInt("threadId"), rs.getInt("categoryId"),
							rs.getInt("accountId"), rs.getString("name"), rs.getString("address"),
							rs.getDouble("latitude"), rs.getDouble("longitude"), rs.getString("content"),
							rs.getLong("price"), rs.getInt("electricFee"), rs.getInt("waterFee"), rs.getInt("otherFee"),
							rs.getInt("area"), rs.getBoolean("wifi"), rs.getBoolean("waterHeater"),
							rs.getBoolean("conditioner"), rs.getBoolean("fridge"), rs.getBoolean("attic"),
							rs.getBoolean("camera"), rs.getInt("waterSource"), rs.getString("direction"),
							rs.getInt("numOfToilets"), rs.getInt("numOfPeople"), rs.getInt("object"),
							rs.getInt("villageId"), rs.getString("created"), rs.getInt("viewed"), rs.getInt("status"),
							rs.getString("imageThumb"));
					if (threadTemp.getPrice() >= 1000000) {
						threadTemp.setPriceString(
								numberFormat.format(((double) (threadTemp.getPrice() / (1.0 * 1000000)))) + " triệu ");
					} else if (threadTemp.getPrice() > 1000) {
						threadTemp.setPriceString((threadTemp.getPrice() / 1000) + " ngàn ");
					}
					temp.add(threadTemp);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			// Đóng kết nối
			pr.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// Trả về kết quả
		// Log.in(temp.toString());
		return temp;
	}

	// Xóa
	public boolean delete(Thread thread) {
		Log.in("Da vao dao xoa " + thread.toString());
		// Mở kết nối
		connect();
		try {

			// Câu lệnh xóa
			String sql = "delete from Thread where threadId = ?";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền accounId vào
			pr.setInt(1, thread.getThreadId());

			// Thực hiện query update
			if (pr.executeUpdate() > 0) {
				// Đóng kết nối
				pr.close();
				connection.close();
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public void add(Thread thread) {

		// Mở kết nối
		connect();
		try {

			// Câu lệnh select
			String sql = "insert into Thread(categoryId, accountId, name, address, latitude, longitude, content, price, electricFee, waterFee, otherFee, area, wifi, waterHeater, conditioner, fridge, attic, camera, waterSource, direction, numOfToilets, numOfPeople, object, villageId, created, viewed, status ) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền các tham số
			pr.setInt(1, thread.getCategoryId());
			pr.setInt(2, thread.getAccountId());
			pr.setString(3, thread.getName());
			pr.setString(4, thread.getAddress());
			pr.setDouble(5, thread.getLatitude());
			pr.setDouble(6, thread.getLongitude());
			pr.setString(7, thread.getContent());
			pr.setLong(8, thread.getPrice());
			pr.setInt(9, thread.getElectricFee());
			pr.setInt(10, thread.getWaterFee());
			pr.setInt(11, thread.getOtherFee());
			pr.setInt(12, thread.getArea());
			pr.setBoolean(13, thread.isWifi());
			pr.setBoolean(14, thread.isWaterHeater());
			pr.setBoolean(15, thread.isConditioner());
			pr.setBoolean(16, thread.isFridge());
			pr.setBoolean(17, thread.isAttic());
			pr.setBoolean(18, thread.isCamera());
			pr.setInt(19, thread.getWaterSource());
			pr.setString(20, thread.getDirection());
			pr.setInt(21, thread.getNumOfToilets());
			pr.setInt(22, thread.getNumOfPeople());
			pr.setInt(23, thread.getObject());
			pr.setInt(24, thread.getVillageId());
			pr.setString(25, thread.getCreated());
			pr.setInt(26, thread.getViewed());
			pr.setInt(27, thread.getStatus());
			// Thực hiện
			pr.executeUpdate();

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Thread getById(Thread thread) {

		// Mở kết nối
		connect();

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		Thread threadData = new Thread();
		try {

			// Câu lệnh truy vấn
			String sql = "select Thread.*,Province.provinceId, District.districtId, Village.name as villageName, District.name as districtName, Province.name as provinceName, temp.avgScore, temp2.rateNum from Thread inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId inner join Village on Thread.villageId = Village.villageId inner join District on Village.districtId = District.districtId inner join Province on Province.provinceId = District.provinceId left join (select Rate.threadId, COUNT(Rate.rateId) as rateNum from Rate where Rate.threadId = ? group by Rate.threadId) temp2 on Thread.threadId = temp2.threadId where Thread.threadId = ?";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền tham số
			pr.setInt(1, thread.getThreadId());
			pr.setInt(2, thread.getThreadId());

			// Thực hiện
			rs = pr.executeQuery();

			// Lấy kết quả đưa vào accountData
			if (rs.next()) {
				threadData = new Thread(rs.getInt("threadId"), rs.getInt("categoryId"), rs.getInt("accountId"),
						rs.getString("name"), rs.getString("address"), rs.getDouble("latitude"),
						rs.getDouble("longitude"), rs.getString("content"), rs.getLong("price"),
						rs.getInt("electricFee"), rs.getInt("waterFee"), rs.getInt("otherFee"), rs.getInt("area"),
						rs.getBoolean("wifi"), rs.getBoolean("waterHeater"), rs.getBoolean("conditioner"),
						rs.getBoolean("fridge"), rs.getBoolean("attic"), rs.getBoolean("camera"),
						rs.getInt("waterSource"), rs.getString("direction"), rs.getInt("numOfToilets"),
						rs.getInt("numOfPeople"), rs.getInt("object"), rs.getInt("villageId"), rs.getString("created"),
						rs.getInt("viewed"), rs.getInt("status"), rs.getString("imageThumb"));

				DecimalFormat numberFormat = new DecimalFormat("#.##");
				if (threadData.getPrice() >= 1000000) {
					threadData.setPriceString(
							numberFormat.format(((double) (threadData.getPrice() / (1.0 * 1000000)))) + " triệu ");
				} else if (threadData.getPrice() > 1000) {
					threadData.setPriceString((threadData.getPrice() / 1000) + " ngàn ");
				}
				DecimalFormat df = new DecimalFormat("#.#");
				String valueStr = df.format(rs.getFloat("avgScore"));
				valueStr = valueStr.replace(',', '.');

				//// Log.in(df.format(rs.getFloat("avgScore")) + " " +
				//// valueStr);
				threadData.setAvgScore(Float.parseFloat(valueStr));
				threadData.setAvgScoreInt((int) threadData.getAvgScore());
				threadData.setVillage(new Village(0, 0, rs.getString("villageName")));
				threadData.setDistrict(new District(0, 0, rs.getString("districtName")));
				threadData.setProvince(new Province(0, rs.getString("provinceName")));
				threadData.setRateNum(rs.getInt("rateNum"));
				threadData.setProvinceId(rs.getInt("provinceId"));
				threadData.setDistrictId(rs.getInt("districtId"));
				threadData.setKindOf(rs.getBoolean("kindOf"));
				try {
					if (Check.old(rs.getString("created"))) {
						// Log.in("Set true dao");
						threadData.setOld(true);
					} else {
						// Log.in("Set false dao");
						threadData.setOld(false);
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// Log.in( "Thread " + threadData.isOld());
				// Câu lệnh truy vấn
				sql = "update Thread set viewed = (viewed + 1) where threadId = ?";
				pr = connection.prepareStatement(sql);

				// Truyền tham số
				pr.setInt(1, thread.getThreadId());

				// Thực hiện
				pr.executeUpdate();

			}

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return threadData;
	}

	public ArrayList<Thread> getListByCategory(Category category, int page) {

		// Mở kết nối
		connect();

		// Biến lưu vị trí offset bắt đầu select, toognr số dòng trong csdl
		int offset = 0, total = 0, totalPage = 0;

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		ArrayList<Thread> temp = new ArrayList<Thread>();
		try {

			// Câu lệnh đếm có bao nhiêu dòng trong csdl
			String sqlCount = "select count(threadId) as total from Thread where categoryId = ?";
			PreparedStatement pr = connection.prepareStatement(sqlCount);
			pr.setInt(1, category.getCategoryId());
			rs = pr.executeQuery();
			try {
				if (rs.next()) {
					// Lưu lại tổng số dòng
					total = rs.getInt("total");
					// Vị trí select = số trang * với số dòng trong 1 trang muốn
					// lấy
					offset = (page - 1) > 0 ? ((page - 1) * Pagination.itemPerPageView) : 0;

					// Nếu vị trí vượt quá số donngf, thì lấy trang cuối cùng
					if (offset >= total) {
						offset = offset - (Pagination.itemPerPageView) > 0 ? offset - (Pagination.itemPerPageView) : 0;
					}

					// Tính toán tổng số trang
					totalPage = (int) Math.ceil(1.0 * total / Pagination.itemPerPageView);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			// Câu lệnh truy vấn
			String sql = "select Thread.*, temp.avgScore from Thread inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId where categoryId = ?  order by Thread.threadId "
					+ " offset " + offset + " rows fetch next " + Pagination.itemPerPageView + " row only";
			pr = connection.prepareStatement(sql);
			// Log.in("query " + sql);
			// Truyền tham số
			pr.setInt(1, category.getCategoryId());

			// Thực hiện
			rs = pr.executeQuery();

			DecimalFormat numberFormat = new DecimalFormat("#.##");
			while (rs.next()) {
				Thread threadTemp = new Thread(rs.getInt("threadId"), rs.getInt("categoryId"), rs.getInt("accountId"),
						rs.getString("name"), rs.getString("address"), rs.getDouble("latitude"),
						rs.getDouble("longitude"), rs.getString("content"), rs.getLong("price"),
						rs.getInt("electricFee"), rs.getInt("waterFee"), rs.getInt("otherFee"), rs.getInt("area"),
						rs.getBoolean("wifi"), rs.getBoolean("waterHeater"), rs.getBoolean("conditioner"),
						rs.getBoolean("fridge"), rs.getBoolean("attic"), rs.getBoolean("camera"),
						rs.getInt("waterSource"), rs.getString("direction"), rs.getInt("numOfToilets"),
						rs.getInt("numOfPeople"), rs.getInt("object"), rs.getInt("villageId"), rs.getString("created"),
						rs.getInt("viewed"), rs.getInt("status"), rs.getString("imageThumb"));
				if (threadTemp.getPrice() >= 1000000) {
					threadTemp.setPriceString(
							numberFormat.format(((double) (threadTemp.getPrice() / (1.0 * 1000000)))) + " triệu ");
				} else if (threadTemp.getPrice() > 1000) {
					threadTemp.setPriceString((threadTemp.getPrice() / 1000) + " ngàn ");
				}
				DecimalFormat df = new DecimalFormat("#.#");
				String valueStr = df.format(rs.getFloat("avgScore"));
				valueStr = valueStr.replace(',', '.');

				// Log.in(df.format(rs.getFloat("avgScore")) + " " + valueStr);
				threadTemp.setTotal(totalPage);
				// Log.in("Tong so trang: " + totalPage);
				threadTemp.setAvgScore(Float.parseFloat(valueStr));
				threadTemp.setAvgScoreInt((int) threadTemp.getAvgScore());
				temp.add(threadTemp);
			}

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return temp;
	}

	public ArrayList<Thread> getRelateThreadsByThread(Thread thread) {

		// Mở kết nối
		connect();

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		ArrayList<Thread> temp = new ArrayList<Thread>();
		try {
			int categoryId = 0;
			// Câu lệnh truy vấn
			String sql = "select categoryId from Thread where threadId = ?";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền các biến vào câu lệnh để thực thi
			pr.setInt(1, thread.getThreadId());
			rs = pr.executeQuery();

			if (rs.next()) {
				categoryId = rs.getInt("categoryId");
			}

			DecimalFormat numberFormat = new DecimalFormat("#.##");
			sql = "select Thread.* , temp.avgScore from Thread inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId where categoryId = ?  order by threadId OFFSET 0 ROWS FETCH NEXT 6 ROWS ONLY";

			pr = connection.prepareStatement(sql);

			// Truyền các biến vào câu lệnh để thực thi
			pr.setInt(1, categoryId);
			rs = pr.executeQuery();

			while (rs.next()) {
				Thread threadTemp = new Thread(rs.getInt("threadId"), rs.getInt("categoryId"), rs.getInt("accountId"),
						rs.getString("name"), rs.getString("address"), rs.getDouble("latitude"),
						rs.getDouble("longitude"), rs.getString("content"), rs.getLong("price"),
						rs.getInt("electricFee"), rs.getInt("waterFee"), rs.getInt("otherFee"), rs.getInt("area"),
						rs.getBoolean("wifi"), rs.getBoolean("waterHeater"), rs.getBoolean("conditioner"),
						rs.getBoolean("fridge"), rs.getBoolean("attic"), rs.getBoolean("camera"),
						rs.getInt("waterSource"), rs.getString("direction"), rs.getInt("numOfToilets"),
						rs.getInt("numOfPeople"), rs.getInt("object"), rs.getInt("villageId"), rs.getString("created"),
						rs.getInt("viewed"), rs.getInt("status"), rs.getString("imageThumb"));

				if (threadTemp.getPrice() >= 1000000) {
					threadTemp.setPriceString(
							numberFormat.format(((double) (threadTemp.getPrice() / (1.0 * 1000000)))) + " triệu ");
				} else if (threadTemp.getPrice() > 1000) {
					threadTemp.setPriceString((threadTemp.getPrice() / 1000) + " ngàn ");
				}
				DecimalFormat df = new DecimalFormat("#.#");
				String valueStr = df.format(rs.getFloat("avgScore"));
				valueStr = valueStr.replace(',', '.');

				// Log.in(df.format(rs.getFloat("avgScore")) + " " + valueStr);
				threadTemp.setAvgScore(Float.parseFloat(valueStr));
				threadTemp.setAvgScoreInt((int) threadTemp.getAvgScore());
				temp.add(threadTemp);
			}

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return temp;
	}

	public ArrayList<Thread> searchBy(Thread thread, int page) {

		/* Mở kết nối */
		connect();

		int offset = 0, total = 0, totalPage = 0;

		/* Lưu kết quả truy vấn */
		ResultSet rs = null;

		/* Tao ra cau dieu kien where */
		String filter = "";
		int count = 0;
		if (thread.isWifi() == true) {
			if (count == 0)
				filter += " WHERE ";
			count++;
			filter += "wifi = 1";
		}
		if (thread.isWaterHeater() == true) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			filter += " waterHeater = 1";
		}
		if (thread.isConditioner() == true) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			filter += " conditioner = 1 ";
		}
		if (thread.isFridge() == true) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			filter += " fridge = 1 ";
		}
		if (thread.isAttic() == true) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			filter += " attic = 1 ";
		}
		if (thread.isCamera() == true) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			filter += " camera = 1 ";
		}
		if (thread.getWaterSource() > 0) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			filter += " waterSource =  " + thread.getWaterSource();
		}
		if (thread.getObject() > 0) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			filter += " object = " + thread.getObject();
		}
		if (thread.getArea() > 0) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			if (thread.getArea() == 1) {
				filter += " area < 15";
			} else if (thread.getArea() == 2) {
				filter += " area between 15 and 25 ";
			} else if (thread.getArea() == 3) {
				filter += " area between 25 and 35 ";
			} else if (thread.getArea() == 4) {
				filter += " area between 35 and 50 ";
			} else if (thread.getArea() == 5) {
				filter += " area > 50 ";
			}
		}
		if (thread.getPrice() > 0) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			if (thread.getPrice() == 1) {
				filter += " price < 500000";
			} else if (thread.getPrice() == 2) {
				filter += " price between 500000 and 1000000 ";
			} else if (thread.getPrice() == 3) {
				filter += " price between 1000000 and 1500000 ";
			} else if (thread.getPrice() == 4) {
				filter += " price between 1500000 and 2500000 ";
			} else if (thread.getPrice() == 4) {
				filter += " price between 2500000 and 5000000 ";
			} else if (thread.getPrice() == 5) {
				filter += " price > 5000000 ";
			}
		}
		if (thread.getFar() > 0) {
			int meter = 0;
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			if (thread.getFar() == 1) {
				meter = 500;
			} else if (thread.getFar() == 2) {
				meter = 1500;
			} else if (thread.getFar() == 3) {
				meter = 3000;
			} else if (thread.getFar() == 4) {
				meter = 6000;
			} else if (thread.getFar() == 5) {
				meter = 10000;
			} else if (thread.getFar() == 6) {
				meter = 20000;
			}

			double epxilong = 0.000008998719243599958 * meter;
			double lat = thread.getLatitude();
			double lng = thread.getLongitude();
			double latUp, latDown, lngUp, lngDown;
			latUp = lat + epxilong;
			lngUp = lng + epxilong;
			latDown = lat - epxilong;
			lngDown = lng - epxilong;
			// Log.in("Met: " + meter + ", Ex: " + epxilong + "Lat: " + lat + ",
			// Lng: " + lng);
			filter += " Thread.latitude between " + latDown + " and " + latUp + " and Thread.longitude between "
					+ lngDown + " and " + lngUp + "";
			count++;
		}
		if (thread.getProvince().getProvinceId() > 0) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			filter += " Province.provinceId = " + thread.getProvince().getProvinceId();
		}
		if (thread.getDistrict().getDistrictId() > 0) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			filter += " District.districtId = " + thread.getDistrict().getDistrictId();
		}
		if (thread.getVillage().getVillageId() > 0) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			filter += " Village.villageId = " + thread.getVillage().getVillageId();
		}
		if (thread.getName().length() > 0) {
			if (count == 0)
				filter += " WHERE ";
			else
				filter += " AND  ";
			count++;
			String nameAscii = Check.removeAccent(thread.getName());
			filter += " cast(Thread.name as varchar(100)) COLLATE SQL_Latin1_General_CP1253_CI_AI like '%"
					+ thread.getName() + "%' or Thread.name like '%" + nameAscii + "' ";
		}

		/* START COUNT */
		try {
			// Dem co bao nhieu dong ket qua dung voi dieu kien tim kiem
			String sqlCount = "select count(Thread.threadId) as total from  Thread inner join Village on Village.villageId = Thread.villageId inner join District on District.districtId = Village.districtId inner join Province on Province.provinceId = District.provinceId"
					+ filter;
			// Log.in(sqlCount);
			// return null;
			PreparedStatement pr = connection.prepareStatement(sqlCount);
			rs = pr.executeQuery();
			if (rs.next()) {
				// Lưu lại tổng số dòng
				total = rs.getInt("total");
				// Vị trí select = số trang * với số dòng trong 1 trang muốn
				// lấy
				offset = (page - 1) > 0 ? ((page - 1) * Pagination.itemPerPageView) : 0;

				// Nếu vị trí vượt quá số donngf, thì lấy trang cuối cùng
				if (offset >= total) {
					offset = offset - (Pagination.itemPerPageView) > 0 ? offset - (Pagination.itemPerPageView) : 0;
				}

				// Tính toán tổng số trang
				totalPage = (int) Math.ceil(1.0 * total / Pagination.itemPerPageView);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		/* END COUNT */

		/* Phan trang ket qua tim kiem duoc */

		filter += " order by threadId offset " + offset + " rows fetch next " + Pagination.itemPerPageView
				+ " row only";
		// Lưu thông tin account
		ArrayList<Thread> temp = new ArrayList<Thread>();
		try {

			// Câu lệnh truy vấn
			String sql = "select Thread.*, temp.avgScore from Thread inner join Village on Village.villageId = Thread.villageId inner join District on District.districtId = Village.districtId inner join Province on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId  "
					+ filter;
			// Log.in(sql);
			Log.in("SQL: " + sql);
			PreparedStatement pr = connection.prepareStatement(sql);

			// Thực hiện
			rs = pr.executeQuery();
			// Lấy kết quả đưa vào accountData
			DecimalFormat numberFormat = new DecimalFormat("#.##");
			while (rs.next()) {
				Thread threadTemp = new Thread(rs.getInt("threadId"), rs.getInt("categoryId"), rs.getInt("accountId"),
						rs.getString("name"), rs.getString("address"), rs.getDouble("latitude"),
						rs.getDouble("longitude"), rs.getString("content"), rs.getLong("price"),
						rs.getInt("electricFee"), rs.getInt("waterFee"), rs.getInt("otherFee"), rs.getInt("area"),
						rs.getBoolean("wifi"), rs.getBoolean("waterHeater"), rs.getBoolean("conditioner"),
						rs.getBoolean("fridge"), rs.getBoolean("attic"), rs.getBoolean("camera"),
						rs.getInt("waterSource"), rs.getString("direction"), rs.getInt("numOfToilets"),
						rs.getInt("numOfPeople"), rs.getInt("object"), rs.getInt("villageId"), rs.getString("created"),
						rs.getInt("viewed"), rs.getInt("status"), rs.getString("imageThumb"));
				if (threadTemp.getPrice() >= 1000000) {
					threadTemp.setPriceString(
							numberFormat.format(((double) (threadTemp.getPrice() / (1.0 * 1000000)))) + " triệu ");
				} else if (threadTemp.getPrice() > 1000) {
					threadTemp.setPriceString((threadTemp.getPrice() / 1000) + " ngàn ");
				}
				DecimalFormat df = new DecimalFormat("#.#");
				String valueStr = df.format(rs.getFloat("avgScore"));
				valueStr = valueStr.replace(',', '.');

				// Log.in(df.format(rs.getFloat("avgScore")) + " " + valueStr);
				threadTemp.setAvgScore(Float.parseFloat(valueStr));
				threadTemp.setAvgScoreInt((int) threadTemp.getAvgScore());
				threadTemp.setTotalPage(totalPage);
				threadTemp.setPage(page);
				temp.add(threadTemp);
			}

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return temp;
	}

	public boolean edit(ThreadForm thread) {

		// Mở kết nối
		connect();
		try {

			// Câu lệnh select
			String sql = "update Thread set categoryId=?, name=?, address=?, latitude=?, longitude=?, content=?, price=?, electricFee=?, waterFee=?, otherFee=?, area=?, wifi=?, waterHeater=?, conditioner=?, fridge=?, attic=?, camera=?, waterSource=?, direction=?, numOfToilets=?, numOfPeople=?, object=?, villageId=?, kindOf=?, imageThumb=? where threadId=?";
			
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền các tham số
			pr.setInt(1, thread.getCategoryId());
			pr.setString(2, thread.getName());
			pr.setString(3, thread.getAddress());
			pr.setDouble(4, thread.getLatitude());
			pr.setDouble(5, thread.getLongitude());
			pr.setString(6, thread.getContent());
			pr.setLong(7, thread.getPrice());
			pr.setInt(8, thread.getElectricFee());
			pr.setInt(9, thread.getWaterFee());
			pr.setInt(10, thread.getOtherFee());
			pr.setInt(11, thread.getArea());
			pr.setBoolean(12, thread.isWifi());
			pr.setBoolean(13, thread.isWaterHeater());
			pr.setBoolean(14, thread.isConditioner());
			pr.setBoolean(15, thread.isFridge());
			pr.setBoolean(16, thread.isAttic());
			pr.setBoolean(17, thread.isCamera());
			pr.setInt(18, thread.getWaterSource());
			pr.setString(19, thread.getDirection());
			pr.setInt(20, thread.getNumOfToilets());
			pr.setInt(21, thread.getNumOfPeople());
			pr.setInt(22, thread.getObject());
			pr.setInt(23, thread.getVillageId());
			pr.setBoolean(24, thread.isKindOf());
			pr.setString(25, thread.getImageThumb());
			pr.setInt(26, thread.getThreadId());

			// Thực hiện
			int count = -1;
			try {
				count = pr.executeUpdate();
				Log.in("Dau vao " + thread.toString());
			} catch (Exception e) {
				Log.in(e.getMessage());
			}
			// Đóng kết nối
			pr.close();
			connection.close();
			if (count > 0) {
				System.out.println("success");
				return true;
			} else {
				System.out.println("stuck somewhere");
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

	public ArrayList<Thread> getListByAccount(Account account, int page) {

		// Mở kết nối
		connect();

		// Biến lưu vị trí offset bắt đầu select, toognr số dòng trong csdl
		int offset = 0, total = 0, totalPage = 0;

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		ArrayList<Thread> temp = new ArrayList<Thread>();
		try {

			// Câu lệnh đếm có bao nhiêu dòng trong csdl
			String sqlCount = "select count(threadId) as total from Thread where accountId = ?";
			PreparedStatement pr = connection.prepareStatement(sqlCount);
			pr.setInt(1, account.getAccountId());
			rs = pr.executeQuery();
			try {
				if (rs.next()) {
					// Lưu lại tổng số dòng
					total = rs.getInt("total");
					// Vị trí select = số trang * với số dòng trong 1 trang muốn
					// lấy
					offset = (page - 1) > 0 ? ((page - 1) * Pagination.itemPerPageView) : 0;

					// Nếu vị trí vượt quá số donngf, thì lấy trang cuối cùng
					if (offset >= total) {
						offset = offset - (Pagination.itemPerPageView) > 0 ? offset - (Pagination.itemPerPageView) : 0;
					}

					// Tính toán tổng số trang
					totalPage = (int) Math.ceil(1.0 * total / Pagination.itemPerPageView);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			// Câu lệnh truy vấn
			String sql = "select Thread.*, Category.name as categoryName, temp.avgScore from Thread inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId inner join Category on Category.categoryId = Thread.categoryId where accountId = ?  order by Thread.threadId "
					+ " offset " + offset + " rows fetch next " + Pagination.itemPerPageView + " row only";
			pr = connection.prepareStatement(sql);
			//Log.in("query " + sql);
			// Truyền tham số
			pr.setInt(1, account.getAccountId());

			// Thực hiện
			rs = pr.executeQuery();

			DecimalFormat numberFormat = new DecimalFormat("#.##");
			while (rs.next()) {
				Thread threadTemp = new Thread(rs.getInt("threadId"), rs.getInt("categoryId"), rs.getInt("accountId"),
						rs.getString("name"), rs.getString("address"), rs.getDouble("latitude"),
						rs.getDouble("longitude"), rs.getString("content"), rs.getLong("price"),
						rs.getInt("electricFee"), rs.getInt("waterFee"), rs.getInt("otherFee"), rs.getInt("area"),
						rs.getBoolean("wifi"), rs.getBoolean("waterHeater"), rs.getBoolean("conditioner"),
						rs.getBoolean("fridge"), rs.getBoolean("attic"), rs.getBoolean("camera"),
						rs.getInt("waterSource"), rs.getString("direction"), rs.getInt("numOfToilets"),
						rs.getInt("numOfPeople"), rs.getInt("object"), rs.getInt("villageId"), rs.getString("created"),
						rs.getInt("viewed"), rs.getInt("status"), rs.getString("imageThumb"));
				if (threadTemp.getPrice() >= 1000000) {
					threadTemp.setPriceString(
							numberFormat.format(((double) (threadTemp.getPrice() / (1.0 * 1000000)))) + " triệu ");
				} else if (threadTemp.getPrice() > 1000) {
					threadTemp.setPriceString((threadTemp.getPrice() / 1000) + " ngàn ");
				}
				DecimalFormat df = new DecimalFormat("#.#");
				String valueStr = df.format(rs.getFloat("avgScore"));
				valueStr = valueStr.replace(',', '.');

				// Log.in(df.format(rs.getFloat("avgScore")) + " " + valueStr);
				threadTemp.setTotal(totalPage);
				// Log.in("Tong so trang: " + totalPage);
				threadTemp.setAvgScore(Float.parseFloat(valueStr));
				threadTemp.setAvgScoreInt((int) threadTemp.getAvgScore());
				threadTemp.setCategoryName(rs.getString("categoryName"));
				temp.add(threadTemp);
				// Log.in("Account co: " + threadTemp.toString());
			}
			// Log.in("Account co: " + temp.toString());
			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return temp;
	}
}
