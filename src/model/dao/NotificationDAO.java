package model.dao;

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
import statics.SQLServer;
import statics.Log;

public class NotificationDAO {

	public ArrayList<Notification> getListByAccount(int accountId) {

		// Open connect
		SQLServer.connect();

		ResultSet rs = null;
		ArrayList<Notification> temp = new ArrayList<Notification>();
		PreparedStatement pr = null;
		try {

			String sql = "select Notification.*, Account.avatar from Notification inner join Account on Notification.accountIdPush = Account.accountId where Notification.accountId = ? order by notificationId desc";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, accountId);
			rs = pr.executeQuery();

			while (rs.next()) {
				Notification notification = new Notification(rs.getInt("notificationId"), rs.getInt("threadId"),
						rs.getInt("rateId"), rs.getInt("accountId"), rs.getString("content"), rs.getString("created"),
						"", rs.getBoolean("status"));
				notification.setAvatar(rs.getString("avatar"));
				PrettyTime p = new PrettyTime(new Locale("vi"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
				try {
					Date date = sdf.parse(notification.getCreated());
					notification.setTimeCount(p.format(date));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				temp.add(notification);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // Close connect
			try {
				rs.close();
			} catch (Exception e2) {
			}
			try {
				pr.close();
			} catch (Exception e2) {
			}
			SQLServer.disconnect();
		}

		return temp;
	}

	public boolean read(int notificationId, int accountId) {

		// Open connect
		SQLServer.connect();

		ArrayList<Notification> temp = new ArrayList<Notification>();
		PreparedStatement pr = null;
		int count = 0;
		try {
			String sql = "update Notification set status = 1 where notificationId = ? AND accountId =?";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, notificationId);
			pr.setInt(2, accountId);
			count = pr.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // Close connect
			try {
				pr.close();
			} catch (Exception e2) {
			}
			SQLServer.disconnect();
		}

		return count > 0 ? true : false;
	}

	public boolean add(Notification notification) {

		// Open connect
		SQLServer.connect();
		PreparedStatement pr = null;
		int count = 0;
		try {
			String sql = "insert into Notification(threadId, rateId, accountId, accountIdPush, content, created) values(?, ?, ?, ?, ?, GETDATE())";
			pr = SQLServer.connection.prepareStatement(sql);

			int rateId = notification.getRateId();
			pr.setInt(1, notification.getThreadId());
			if (rateId == 0) {
				pr.setNull(2, java.sql.Types.INTEGER);
			} else {
				pr.setInt(2, notification.getRateId());
			}
			pr.setInt(3, notification.getAccountId());
			pr.setInt(4, notification.getAccountIdPush());
			pr.setString(5, notification.getContent());

			count = pr.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // Close connect
			try {
				pr.close();
			} catch (Exception e2) {
			}
			SQLServer.disconnect();
		}

		return count > 0 ? true : false;

	}

}
