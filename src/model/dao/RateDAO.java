package model.dao;

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
import statics.SQLServer;
import statics.Pagination;

public class RateDAO {

	public ArrayList<Rate> getListByThread(Thread thread, int accountId) {

		// Open SQLServer.connect
		SQLServer.connect();

		ResultSet rs = null;
		PreparedStatement pr = null;
		ArrayList<Rate> rates = new ArrayList<Rate>();
		try {

			String sql = "select Rate.*, Account.name as accountName, Account.avatar as avatar from Rate inner join Account on Rate.accountId = Account.accountId  where Rate.threadId = ? order by rateId desc";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, thread.getThreadId());
			rs = pr.executeQuery();
			while (rs.next()) {
				Rate rate = new Rate(rs.getInt("rateId"), rs.getInt("threadId"), rs.getInt("accountId"),
						rs.getString("created"), rs.getString("accountName"), rs.getString("avatar"),
						rs.getString("content"), rs.getInt("score"));
				PrettyTime p = new PrettyTime(new Locale("vi"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
				try {
					Date date = sdf.parse(rate.getCreated());
					rate.setCreated(p.format(date));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				if (rate.getAccountId() == accountId) {
					rate.setCan(true);
				}
				rates.add(rate);
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

		return rates;
	}

	public ArrayList<Rate> getListByAccount(Account account, int page) {

		// Open SQLServer.connect
		SQLServer.connect();

		int offset = 0, total = 0, totalPage = 0;
		ResultSet rs = null;
		ArrayList<Rate> rates = new ArrayList<Rate>();
		PreparedStatement pr = null;
		try {
			String sqlCount = "select count(rateId) as total from Rate where accountId = ?";
			pr = SQLServer.connection.prepareStatement(sqlCount);
			pr.setInt(1, account.getAccountId());
			rs = pr.executeQuery();
			try {
				if (rs.next()) {
					total = rs.getInt("total");
					offset = (page - 1) > 0 ? ((page - 1) * Pagination.itemPerPageView) : 0;

					if (offset >= total) {
						offset = offset - (Pagination.itemPerPageView) > 0 ? offset - (Pagination.itemPerPageView) : 0;
					}

					totalPage = (int) Math.ceil(1.0 * total / Pagination.itemPerPageView);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String sql = "select Rate.* from Rate where Rate.accountId = ? order by Rate.rateId desc" + " offset "
					+ offset + " rows fetch next " + Pagination.itemPerPageView + " row only";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, account.getAccountId());
			rs = pr.executeQuery();

			while (rs.next()) {
				Rate rate = new Rate(rs.getInt("rateId"), rs.getInt("threadId"), rs.getInt("accountId"),
						rs.getString("created"), "", "", rs.getString("content"), rs.getInt("score"));
				rate.setTotal(totalPage);
				PrettyTime p = new PrettyTime(new Locale("vi"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
				try {
					Date date = sdf.parse(rate.getCreated());
					rate.setCreated(p.format(date));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				rate.setCan(true);
				rates.add(rate);
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

		return rates;
	}

	public int addRate(Rate rate) {
		// Open connect
		SQLServer.connect();
		PreparedStatement pr = null;
		int count = 0;
		int rateId = 0;
		try {
			String sql = "insert into Rate(threadId,accountId,content,score,created)" + " VALUES(?,?,?,?,?)";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, rate.getThreadId());
			pr.setInt(2, rate.getAccountId());
			pr.setString(3, rate.getContent());
			pr.setInt(4, rate.getScore());
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			Date today = Calendar.getInstance().getTime();
			String reportDate = df.format(today);
			pr.setString(5, reportDate);
			count = pr.executeUpdate();

			if (count > 0) {
				sql = "select top 1 rateId from Rate where threadId = ? and accountId = ? order by rateId desc";
				pr = SQLServer.connection.prepareStatement(sql);
				pr.setInt(1, rate.getThreadId());
				pr.setInt(2, rate.getAccountId());
				ResultSet rs = pr.executeQuery();
				if (rs.next()) {
					rateId = rs.getInt("rateId");
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // Close connect
			try {
				pr.close();
			} catch (Exception e2) {
			}
			SQLServer.disconnect();
		}

		return rateId;
	}

	public boolean delete(int rateId, int accountId) {

		// Open connect
		SQLServer.connect();
		PreparedStatement pr = null;
		int count = 0;
		try {

			String sql = "delete from Rate where rateId = ? and accountId = ?";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, rateId);
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

	public boolean update(int rateId, int accountId, String content) {

		// Open connect
		SQLServer.connect();
		PreparedStatement pr = null;
		int count = 0;
		try {
			String sql = "update Rate set content = ? where rateId = ? and accountId = ?";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setString(1, content);
			pr.setInt(2, rateId);
			pr.setInt(3, accountId);
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
