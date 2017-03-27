package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import form.user.thread.ThreadForm;
import model.bean.Category;
import model.bean.Image;
import model.bean.Thread;
import statics.SQLServer;
import statics.Log;

public class ImageDAO {

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

	public ArrayList<Image> getListByThread(Thread thread) {

		// Mở kết nối
		connect();

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		ArrayList<Image> images = new ArrayList<Image>();
		try {

			// Câu lệnh truy vấn
			String sql = "select * from Image where threadId = ? and image360 = 0";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền tham số
			pr.setInt(1, thread.getThreadId());

			// Thực hiện
			rs = pr.executeQuery();

			// Lấy kết quả đưa vào accountData
			while (rs.next()) {
				images.add(new Image(rs.getInt("imageId"), rs.getInt("threadId"), rs.getString("src"),
						rs.getString("content"), rs.getBoolean("image360")));
			}

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return images;
	}

	public ArrayList<Image> getList360ByThread(Thread thread) {// Mở kết nối
		connect();

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		ArrayList<Image> images = new ArrayList<Image>();
		try {

			// Câu lệnh truy vấn
			String sql = "select * from Image where threadId = ? and image360 = 1";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền tham số
			pr.setInt(1, thread.getThreadId());

			// Thực hiện
			rs = pr.executeQuery();

			// Lấy kết quả đưa vào accountData
			while (rs.next()) {
				images.add(new Image(rs.getInt("imageId"), rs.getInt("threadId"), rs.getString("src"),
						rs.getString("content"), rs.getBoolean("image360")));
			}

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return images;
	}

	public boolean delete(ThreadForm threadForm) {
		connect();

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		ArrayList<Image> images = new ArrayList<Image>();
		try {

			// Câu lệnh truy vấn
			String sql = "delete from Image where threadId = ?";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền tham số
			pr.setInt(1, threadForm.getThreadId());

			// Thực hiện
			int count = pr.executeUpdate();

			// Đóng kết nối
			pr.close();
			connection.close();

			if (count > 0)
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

	public boolean insert(ArrayList<Image> images) {
		connect();

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		try {

			PreparedStatement pr = null;
			for (Image image : images) {
				// Câu lệnh truy vấn
				String sql = "insert into Image(threadId, src, content, image360) VALUES(?,?,?,?)";
				pr = connection.prepareStatement(sql);
				
				// Truyền tham số
				pr.setInt(1, image.getThreadId());
				pr.setString(2, image.getSrc());
				pr.setString(3, image.getContent());
				pr.setBoolean(4, false);

				// Thực hiện
				int count = pr.executeUpdate();
				if(count > 0)
					Log.in("THem moi thanh cong" + image.toString());
				else
					Log.in("Them moi that bai");

			}
			// Đóng kết nối
			pr.close();
			connection.close();
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
