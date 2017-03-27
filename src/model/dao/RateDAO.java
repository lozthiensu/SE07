package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.ocpsoft.prettytime.PrettyTime;

import model.bean.Account;
import model.bean.Category;
import model.bean.Image;
import model.bean.Rate;
import model.bean.Thread;
import statics.InfoSQLServer;
import statics.Pagination;

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
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Ket noi loi");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("JDBC loi");
		}
	}

	public ArrayList<Rate> getListByThread(Thread thread, int accountId) {

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
				Rate rate = new Rate(rs.getInt("rateId"), rs.getInt("threadId"), rs.getInt("accountId"),
						rs.getString("created"), rs.getString("accountName"), rs.getString("avatar"),
						rs.getString("content"), rs.getInt("score"));

				PrettyTime p = new PrettyTime(new Locale("vi"));
				//Log.in(notification.toString());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
				try {
					Date date = sdf.parse(rate.getCreated());
					rate.setCreated(p.format(date));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (rate.getAccountId() == accountId) {
					rate.setCan(true);
				}
				rates.add(rate);
			}

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rates;
	}

	public ArrayList<Rate> getListByAccount(Account account, int page) {

		// Mở kết nối
		connect();

		// Biến lưu vị trí offset bắt đầu select, toognr số dòng trong csdl
		int offset = 0, total = 0, totalPage = 0;

		// Lưu kết quả truy vấn
		ResultSet rs = null;

		// Lưu thông tin account
		ArrayList<Rate> rates = new ArrayList<Rate>();
		try {

			// Câu lệnh đếm có bao nhiêu dòng trong csdl
			String sqlCount = "select count(rateId) as total from Rate where accountId = ?";
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
			String sql = "select Rate.* from Rate where Rate.accountId = ? order by Rate.rateId desc"
					+ " offset " + offset + " rows fetch next " + Pagination.itemPerPageView + " row only";
			pr = connection.prepareStatement(sql);
			// Log.in("query " + sql);
			// Truyền tham số
			pr.setInt(1, account.getAccountId());

			// Thực hiện
			rs = pr.executeQuery();

			while (rs.next()) {
				Rate rate = new Rate(rs.getInt("rateId"), rs.getInt("threadId"), rs.getInt("accountId"),
						rs.getString("created"), "", "",
						rs.getString("content"), rs.getInt("score"));
				rate.setTotal(totalPage);
				PrettyTime p = new PrettyTime(new Locale("vi"));
				//Log.in(notification.toString());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
				try {
					Date date = sdf.parse(rate.getCreated());
					rate.setCreated(p.format(date));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				rate.setCan(true);
				rates.add(rate);
			}

			// Đóng kết nối
			pr.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rates;
	}

	public int addRate(Rate rate) { // Mở kết nối
		connect();
		try {

			// Câu lệnh select
			String sql = "insert into Rate(threadId,accountId,content,score,created)" + " VALUES(?,?,?,?,?)";
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
			if (count > 0) {
				sql = "select top 1 rateId from Rate where threadId = ? and accountId = ? order by rateId desc";
				pr = connection.prepareStatement(sql);

				// Truyền các tham số
				pr.setInt(1, rate.getThreadId());
				pr.setInt(2, rate.getAccountId());
				ResultSet rs = pr.executeQuery();
				if (rs.next()) {
					int rateId = rs.getInt("rateId");
					pr.close();
					return rateId;
				}
				pr.close();
				connection.close();
				return 0;
			} else {
				pr.close();
				connection.close();
				return 0;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public boolean delete(int rateId, int accountId) {
		connect();
		try {

			// Câu lệnh select
			String sql = "delete from Rate where rateId = ? and accountId = ?";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền các tham số
			pr.setInt(1, rateId);
			pr.setInt(2, accountId); /* Kiểu null của int */

			// Thực hiện
			int count = pr.executeUpdate();
			// int count = 1;
			// Đóng kết nối
			pr.close();
			connection.close();
			if (count > 0) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean update(int rateId, int accountId, String content) {

		connect();
		try {

			// Câu lệnh select
			String sql = "update Rate set content = ? where rateId = ? and accountId = ?";
			PreparedStatement pr = connection.prepareStatement(sql);

			// Truyền các tham số
			pr.setString(1, content);
			pr.setInt(2, rateId);
			pr.setInt(3, accountId); /* Kiểu null của int */

			// Thực hiện
			int count = pr.executeUpdate();
			// int count = 1;
			// Đóng kết nối
			pr.close();
			connection.close();
			if (count > 0) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
