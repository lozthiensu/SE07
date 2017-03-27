package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Image;
import model.bean.Province;
import model.bean.Thread;
import statics.SQLServer;

public class ProvinceDAO {

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

	public ArrayList<Province> getList() {

		// Mở kết nối
		connect();

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		ArrayList<Province> provinces = new ArrayList<Province>();
		try {

			// Câu lệnh truy vấn
			String sql = "select * from Province";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Thực hiện
			rs = pr.executeQuery();

			// Lấy kết quả đưa vào accountData
			while (rs.next()) {
				provinces.add(new Province(rs.getInt("provinceId"), rs.getString("name")));
			}

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return provinces;
	}

}
