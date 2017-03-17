package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Account;
import model.bean.Category;
import statics.InfoSQLServer;
import statics.Log;
import statics.Pagination;

public class CategoryDAO {

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
	public ArrayList<Category> getList() {
		// Mở kết nối
		connect();

		// Biến lưu kết quả từ truy vấn
		ResultSet rs = null;

		// Lưu danh sách account từ csdl
		ArrayList<Category> temp = new ArrayList<Category>();

		try {

			// Câu lệnh đếm có bao nhiêu dòng trong csdl
			String sql = "select * from Category";
			PreparedStatement pr = connection.prepareStatement(sql);
			rs = pr.executeQuery();
			int dem = 0;
			try {
				while (rs.next()) {
					dem++;
					// Thêm vào arraylist temp
					temp.add(new Category(rs.getInt("categoryId"), rs.getString("name")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			//Log.in("Co " + dem + " danh muc");
			// Đóng kết nối
			pr.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// Trả về kết quả
		return temp;
	}

	// Xóa
	public void delete(Category category) {

		// Mở kết nối
		connect();
		try {

			// Câu lệnh xóa
			String sql = "delete from Category where categoryId = ?";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền accounId vào
			pr.setInt(1, category.getCategoryId());

			// Thực hiện query update
			pr.executeUpdate();

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void add(Category category) {

		// Mở kết nối
		connect();
		try {

			// Câu lệnh select
			String sql = "insert into Category(name)" + " VALUES(?)";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền các tham số
			pr.setString(1, category.getName());

			// Thực hiện
			pr.executeUpdate();

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Category getById(Category category) {

		// Mở kết nối
		connect();

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		Category categoryData = new Category();

		try {

			// Câu lệnh truy vấn
			String sql = "select * from  Category where categoryId = ?";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền tham số
			pr.setInt(1, category.getCategoryId());

			// Thực hiện
			rs = pr.executeQuery();

			// Lấy kết quả đưa vào accountData
			if (rs.next()) {
				categoryData.setCategoryId(rs.getInt(1));
				categoryData.setName(rs.getString(2));
				return categoryData;
			}

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categoryData;
	}

	public void edit(Category category) {

		// Mở kết nối
		connect();
		try {

			// Câu lệnh update
			String sql = "update Category set name = ?  where categoryId = ?";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền tham số
			pr.setString(1, category.getName());
			pr.setInt(2, category.getCategoryId());

			// Thực thi
			pr.executeUpdate();

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
