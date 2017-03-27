package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.ocpsoft.prettytime.PrettyTime;

import model.bean.Category;
import model.bean.Notification;
import model.bean.Thread;
import statics.InfoSQLServer;
import statics.Log;
import statics.Pagination;

public class NotificationDAO {

	// Khai báo các biến để kết nối vs csdl, lưu tại class InfoSQLServer
	String url = InfoSQLServer.url;
	String userName = InfoSQLServer.userName;
	String password = InfoSQLServer.password;
	Connection connection;

	void connect() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager.getConnection(url, userName, password);
			// System.out.println("Ket noi thanh cong");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Ket noi loi");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("JDBC loi");
		}
	}

	public ArrayList<Notification> getListByAccount(int accountId) {

		// Mở kết nối
		connect();

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		ArrayList<Notification> temp = new ArrayList<Notification>();
		try {
			// Câu lệnh truy vấn
			String sql = "select Notification.*, Account.avatar from Notification inner join Account on Notification.accountIdPush = Account.accountId where Notification.accountId = ? order by notificationId desc";
			PreparedStatement pr = connection.prepareStatement(sql);
			// Log.in("query " + sql);
			// Truyền tham số
			pr.setInt(1, accountId);

			// Thực hiện
			rs = pr.executeQuery();

			while (rs.next()) {
				Notification notification = new Notification(rs.getInt("notificationId"), rs.getInt("threadId"),
						rs.getInt("rateId"), rs.getInt("accountId"), rs.getString("content"), rs.getString("created"),
						"", rs.getBoolean("status"));
				notification.setAvatar(rs.getString("avatar"));
				PrettyTime p = new PrettyTime(new Locale("vi"));
				//Log.in(notification.toString());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
				try {
					Date date = sdf.parse(notification.getCreated());
					System.out.println(p.format(date));
					notification.setTimeCount(p.format(date));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				temp.add(notification);
			}
			//Log.in(temp.toString());
			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return temp;
	}

	public boolean read(int notificationId, int accountId) {

		// Mở kết nối
		connect();

		// Lưu kết quả truy vấn

		// Lưu thông tin account
		ArrayList<Notification> temp = new ArrayList<Notification>();
		try {
			// Câu lệnh truy vấn
			String sql = "update Notification set status = 1 where notificationId = ? AND accountId =?";
			PreparedStatement pr = connection.prepareStatement(sql);
			// Log.in("query " + sql);
			// Truyền tham số
			pr.setInt(1, notificationId);
			pr.setInt(2, accountId);

			// Thực hiện
			int count = pr.executeUpdate();

			// Đóng kết nối
			pr.close();
			connection.close();

			if (count > 0)
				return true;
			return false;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean add(Notification notification) {

		// Mở kết nối
		connect();

		// Lưu kết quả truy vấn

		// Lưu thông tin account
		try {
			// Câu lệnh truy vấn
			String sql = "insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(?, ?, ?, ?, ?, GETDATE())";
			PreparedStatement pr = connection.prepareStatement(sql);
			// Log.in("query " + sql);
			// Truyền tham số
			pr.setInt(1, notification.getThreadId());
			pr.setInt(2, notification.getRateId());
			pr.setInt(3, notification.getAccountId());
			pr.setInt(4, notification.getAccountIdPush());
			pr.setString(5, notification.getContent());

			// Thực hiện
			int count = pr.executeUpdate();

			// Đóng kết nối
			pr.close();
			connection.close();

			if (count > 0)
				return true;
			return false;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

}
