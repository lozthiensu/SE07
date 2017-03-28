package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Account;
import model.bean.Login;
import statics.SQLServer;
import statics.Log;
import statics.Pagination;

public class AccountDAO {

	// Get list account by page
	public ArrayList<Account> getListAccount(int page) {

		// Open connect
		SQLServer.connect();

		// Initialize
		int offset = 0, total;
		ResultSet rs = null;
		PreparedStatement pr = null;
		ArrayList<Account> temp = new ArrayList<Account>();

		try {
			// Count total page
			String sqlCount = "select count(accountId) as total from Account";
			pr = SQLServer.connection.prepareStatement(sqlCount);
			rs = pr.executeQuery();
			try {
				if (rs.next()) {
					total = rs.getInt("total");
					offset = (page - 1) > 0 ? ((page - 1) * Pagination.itemPerPageView) : 0;
					if (offset >= total) {
						offset -= (Pagination.itemPerPageView);
					}
					Pagination.page = page;
					Pagination.totalPage = (int) Math.ceil(1.0 * total / Pagination.itemPerPageView);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			// Select data
			String sql = "select * from Account order by accountId desc" + " offset " + offset + " rows fetch next "
					+ Pagination.itemPerPageView + " row only";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();

			try {
				while (rs.next()) {
					temp.add(new Account(rs.getInt("accountId"), rs.getInt("level"), 1, rs.getString("name"),
							rs.getString("email"), rs.getString("password"), rs.getString("phone"),
							rs.getInt("status")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
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

		// Return
		return temp;
	}

	// Delete
	public void deleteAccount(Account account) {

		// Open connect
		SQLServer.connect();
		PreparedStatement pr = null;
		int count = 0;
		try {
			// Delete
			String sql = "delete from Account where accountId = ?";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, account.getAccountId());
			count = pr.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {// Close connect
			try {
				pr.close();
			} catch (Exception e2) {
			}
			SQLServer.disconnect();
		}
		// return count;
	}

	// Add
	public boolean addAccount(Account account) {

		// Open connect
		SQLServer.connect();
		int count = 0;
		PreparedStatement pr = null;
		try {

			// Insert
			String sql = "insert into Account(level,categoryId,name,email,password,phone,status,avatar)"
					+ " VALUES(?,?,?,?,?,?,?,?)";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, account.getLevel());
			pr.setInt(2, account.getCategoryId());
			pr.setString(3, account.getName());
			pr.setString(4, account.getEmail());
			pr.setString(5, account.getPassword());
			pr.setString(6, account.getPhone());
			pr.setInt(7, 1);
			pr.setString(8, "image/avatar.jpg");
			count = pr.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // Close connect
			try {
				pr.close();
			} catch (Exception e) {
			}
			SQLServer.disconnect();
		}
		return count > 0 ? true : false;
	}

	// Get by accountId
	public Account getAccountById(Account account) {

		// Open connect
		SQLServer.connect();

		// Initialize
		ResultSet rs = null;
		PreparedStatement pr = null;
		Account accountData = new Account();

		try {
			// Select
			String sql = "select * from  Account where accountId = ?";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, account.getAccountId());
			rs = pr.executeQuery();
			if (rs.next()) {
				accountData.setAccountId(rs.getInt(1));
				accountData.setLevel(rs.getInt(2));
				accountData.setCategoryId(rs.getInt(3));
				accountData.setName(rs.getString(4));
				accountData.setEmail(rs.getString(5));
				accountData.setPhone(rs.getString(7));
				accountData.setStatus(rs.getInt(8));
				return accountData;
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
		return account;
	}

	// Edit
	public void editAccount(Account account) {

		// Open connect
		SQLServer.connect();
		PreparedStatement pr = null;
		try {

			if (account.getPassword().length() >= 6) {

				String sql = "update Account set level = ?, categoryId = ?, name = ?, email = ?, password = ?, phone = ?, status = ? where accountId = ?";
				pr = SQLServer.connection.prepareStatement(sql);
				pr.setInt(1, account.getLevel());
				pr.setInt(2, account.getCategoryId());
				pr.setString(3, account.getName());
				pr.setString(4, account.getEmail());
				pr.setString(5, account.getPassword());
				pr.setString(6, account.getPhone());
				pr.setInt(7, account.getStatus());
				pr.setInt(8, account.getAccountId());
				pr.executeUpdate();

				pr.close();
				SQLServer.connection.close();

			} else {

				String sql = "update Account set level = ?, categoryId = ?, name = ?, email = ?, phone = ?, status = ? where accountId = ?";
				pr = SQLServer.connection.prepareStatement(sql);
				pr.setInt(1, account.getLevel());
				pr.setInt(2, account.getCategoryId());
				pr.setString(3, account.getName());
				pr.setString(4, account.getEmail());
				pr.setString(5, account.getPhone());
				pr.setInt(6, account.getStatus());
				pr.setInt(7, account.getAccountId());
				pr.executeUpdate();

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
	}

	// Check email exits
	public boolean checkEmail(Account account) {

		// Open connect
		SQLServer.connect();
		PreparedStatement pr = null;
		ResultSet rs = null;
		boolean exits = true;

		try {

			String sql = "select name from Account where email = ?";
			pr = SQLServer.connection.prepareStatement(sql);

			pr.setString(1, account.getEmail());
			rs = pr.executeQuery();

			if (rs.next()) {
				exits = false;
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
		return exits;
	}

	// Login
	public int checkLogin(Account account) {

		// Open connect
		SQLServer.connect();
		int accountId = -1;
		ResultSet rs = null;
		PreparedStatement pr = null;

		try {

			// Select
			String sql = "select accountId from Account where email = ? AND password = ? and status = 1";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setString(1, account.getEmail());
			pr.setString(2, account.getPassword());
			rs = pr.executeQuery();

			if (rs.next()) {
				accountId = rs.getInt("accountId");
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
		return accountId;
	}

	// Login user
	public Account checkLoginAccount(Account account) {
		// Open connect
		SQLServer.connect();
		Account accountData = new Account();
		ResultSet rs = null;
		PreparedStatement pr = null;
		try {

			// Select
			String sql = "select * from Account where email = ? and password = ? and level = 3 and status = 1";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setString(1, account.getEmail());
			pr.setString(2, account.getPassword());
			rs = pr.executeQuery();

			if (rs.next()) {
				accountData = new Account(rs.getInt("accountId"), rs.getInt("level"), rs.getInt("categoryId"),
						rs.getString("name"), rs.getString("email"), rs.getString("password"), rs.getString("phone"),
						rs.getInt("status"));
				accountData.setAvatar(rs.getString("avatar"));
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
		return accountData;
	}

	public Account checkLoginAccountMod(Account account) {
		// Open connect
		SQLServer.connect();
		Account accountData = new Account();
		ResultSet rs = null;
		PreparedStatement pr = null;
		try {

			// Select
			String sql = "select * from Account where email = ? and password = ? and level = 2 and status = 1";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setString(1, account.getEmail());
			pr.setString(2, account.getPassword());
			rs = pr.executeQuery();

			if (rs.next()) {
				accountData = new Account(rs.getInt("accountId"), rs.getInt("level"), rs.getInt("categoryId"),
						rs.getString("name"), rs.getString("email"), rs.getString("password"), rs.getString("phone"),
						rs.getInt("status"));
				accountData.setAvatar(rs.getString("avatar"));
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
		return accountData;
	}

	public ArrayList<Account> getListAccountUser(int page) {

		// Open connect
		SQLServer.connect();

		// Initialize
		int offset = 0, total;
		ResultSet rs = null;
		PreparedStatement pr = null;
		ArrayList<Account> temp = new ArrayList<Account>();

		try {
			// Count total page
			String sqlCount = "select count(accountId) as total from Account where level = 3";
			pr = SQLServer.connection.prepareStatement(sqlCount);
			rs = pr.executeQuery();
			try {
				if (rs.next()) {
					total = rs.getInt("total");
					offset = (page - 1) > 0 ? ((page - 1) * Pagination.itemPerPageView) : 0;
					if (offset >= total) {
						offset -= (Pagination.itemPerPageView);
					}
					Pagination.page = page;
					Pagination.totalPage = (int) Math.ceil(1.0 * total / Pagination.itemPerPageView);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			// Select data
			String sql = "select * from Account where level = 3 order by accountId desc " + " offset " + offset
					+ " rows fetch next " + Pagination.itemPerPageView + " row only";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();

			try {
				while (rs.next()) {
					temp.add(new Account(rs.getInt("accountId"), rs.getInt("level"), 1, rs.getString("name"),
							rs.getString("email"), rs.getString("password"), rs.getString("phone"),
							rs.getInt("status")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
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

		// Return
		return temp;
	}

	public boolean lock(Account account) {
		// Open connect
		SQLServer.connect();
		PreparedStatement pr = null;
		int count = 0;
		try {

			String sql = "update Account set status = 0 where accountId = ?";
			pr = SQLServer.connection.prepareStatement(sql);

			pr.setInt(1, account.getAccountId());

			count = pr.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // Close connect
			try {
				pr.close();
			} catch (Exception e) {
			}
			SQLServer.disconnect();
		}
		return count > 0 ? true : false;
	}

	public boolean unLock(Account account) {
		// Open connect
		SQLServer.connect();
		PreparedStatement pr = null;
		int count = 0;
		try {

			String sql = "update Account set status = 1 where accountId = ?";
			pr = SQLServer.connection.prepareStatement(sql);

			pr.setInt(1, account.getAccountId());

			count = pr.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // Close connect
			try {
				pr.close();
			} catch (Exception e) {
			}
			SQLServer.disconnect();
		}
		return count > 0 ? true : false;
	}

	public Account checkLoginAccountAdmin(Account account) {
		// Open connect
		SQLServer.connect();
		Account accountData = new Account();
		ResultSet rs = null;
		PreparedStatement pr = null;
		try {

			// Select
			String sql = "select * from Account where email = ? and password = ? and level = 1 and status = 1";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setString(1, account.getEmail());
			pr.setString(2, account.getPassword());
			rs = pr.executeQuery();

			if (rs.next()) {
				accountData = new Account(rs.getInt("accountId"), rs.getInt("level"), rs.getInt("categoryId"),
						rs.getString("name"), rs.getString("email"), rs.getString("password"), rs.getString("phone"),
						rs.getInt("status"));
				accountData.setAvatar(rs.getString("avatar"));
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
		return accountData;
	}
}
