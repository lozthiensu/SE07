package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.District;
import model.bean.Province;
import statics.InfoSQLServer;
import statics.Log;

public class DistrictDAO {
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

		public ArrayList<District> getList(Province province) {

			// Mở kết nối
			connect();

			// Lưu kết quả truy vấn
			ResultSet rs = null;

			// Lưu thông tin account
			ArrayList<District> districts = new ArrayList<District>();
			try {

				// Câu lệnh truy vấn
				String sql = "select * from District where provinceId = ?";
				PreparedStatement pr = connection.prepareStatement(sql);
				pr.setInt(1, province.getProvinceId());
				// Thực hiện
				rs = pr.executeQuery();

				// Lấy kết quả đưa vào accountData
				while (rs.next()) {
					districts.add(new District(rs.getInt("districtId"), rs.getInt("provinceId"), rs.getString("name")));
				}
				
				Log.in("List district" + districts.toString());

				// Đóng kết nối
				pr.close();
				connection.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return districts;
		}
}
