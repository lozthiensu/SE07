package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.District;
import model.bean.Province;
import model.bean.Village;
import statics.SQLServer;

public class VillageDAO {
	// Khai báo các biến để kết nối vs csdl, lưu tại class InfoSQLServer
	String url = SQLServer.url;
	String userName = SQLServer.userName;
	String password = SQLServer.password;
	Connection connection;

	void connect() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager.getConnection(url, userName, password);
			//System.out.println("Ket noi thanh cong");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Ket noi loi");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("JDBC loi");
		}
	}

	public ArrayList<Village> getList(District district) {
		// Mở kết nối
		connect();

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		ArrayList<Village> villages = new ArrayList<Village>();
		try {

			// Câu lệnh truy vấn
			String sql = "select * from Village where districtId = ?";
			PreparedStatement pr = connection.prepareStatement(sql);
			pr.setInt(1, district.getDistrictId());

			// Thực hiện
			rs = pr.executeQuery();

			// Lấy kết quả đưa vào accountData
			while (rs.next()) {
				villages.add(new Village(rs.getInt("villageId"), rs.getInt("districtId"), rs.getString("name")));
			}

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return villages;
	}

}
