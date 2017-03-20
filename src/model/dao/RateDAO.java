package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import model.bean.Image;
import model.bean.Rate;
import model.bean.Thread;
import statics.InfoSQLServer;

public class RateDAO {
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

	public ArrayList<Rate> getListByThread(Thread thread) {

		// Mở kết nối
		connect();

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		ArrayList<Rate> rates = new ArrayList<Rate>();
		try {

			// Câu lệnh truy vấn
			String sql = "select Rate.*, Account.name as accountName, Account.avatar as avatar from Rate inner join Account on Rate.accountId = Account.accountId  where Rate.threadId = ? order by rateId desc";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền tham số
			pr.setInt(1, thread.getThreadId());

			// Thực hiện
			rs = pr.executeQuery();

			// Lấy kết quả đưa vào accountData
			while (rs.next()) {
				rates.add(new Rate(rs.getInt("rateId"), rs.getInt("threadId"), rs.getInt("accountId"),
						rs.getString("created"), rs.getString("accountName"), rs.getString("avatar"), rs.getString("content"),
						rs.getInt("score")));
			}

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rates;
	}

	public boolean addRate(Rate rate) { // Mở kết nối
		connect();
		try {

			// Câu lệnh select
			String sql = "insert into Rate(threadId,accountId,content,score,created)"
					+ " VALUES(?,?,?,?,?)";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền các tham số
			pr.setInt(1, rate.getThreadId());
			pr.setInt(2, rate.getAccountId()); /* Kiểu null của int */
			pr.setString(3, rate.getContent());
			pr.setInt(4, rate.getScore());


			DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			
			// Get the date today using Calendar object.
			Date today = Calendar.getInstance().getTime();        
			// Using DateFormat format method we can create a string 
			// representation of a date with the defined format.
			String reportDate = df.format(today);
			
			pr.setString(5, reportDate);
			
			// Thực hiện
			int count = pr.executeUpdate();
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
}
