package model.dao;

import statics.SQLServer;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Account;
import model.bean.Category;
import statics.SQLServer;
import statics.Log;
import statics.Pagination;

public class CategoryDAO {

	// Get list
	public ArrayList<Category> getList() {
		// Open connect
		SQLServer.connect();

		ResultSet rs = null;
		ArrayList<Category> temp = new ArrayList<Category>();
		PreparedStatement pr = null;
		try {

			String sql = "select * from Category order by categoryId desc";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();
			try {
				while (rs.next()) {
					temp.add(new Category(rs.getInt("categoryId"), rs.getString("name")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			pr.close();
			SQLServer.connection.close();
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

	// Xóa
	public void delete(Category category) {

		// Open connnect
		SQLServer.connect();
		PreparedStatement pr = null;
		try {

			String sql = "delete from Category where categoryId = ?";
			pr = SQLServer.connection.prepareStatement(sql);

			pr.setInt(1, category.getCategoryId());

			pr.executeUpdate();

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

	public void add(Category category) {

		// Open connect
		SQLServer.connect();
		PreparedStatement pr = null;
		try {

			String sql = "insert into Category(name)" + " VALUES(?)";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setString(1, category.getName());
			pr.executeUpdate();

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

	public Category getById(Category category) {

		// Open connect
		SQLServer.connect();

		ResultSet rs = null;
		Category categoryData = new Category();
		PreparedStatement pr = null;

		try {

			String sql = "select * from  Category where categoryId = ?";
			pr = SQLServer.connection.prepareStatement(sql);

			pr.setInt(1, category.getCategoryId());
			rs = pr.executeQuery();
			if (rs.next()) {
				categoryData.setCategoryId(rs.getInt(1));
				categoryData.setName(rs.getString(2));
				return categoryData;
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
		return categoryData;
	}

	public void edit(Category category) {

		// Open connect
		SQLServer.connect();
		PreparedStatement pr = null;
		try {

			String sql = "update Category set name = ?  where categoryId = ?";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setString(1, category.getName());
			pr.setInt(2, category.getCategoryId());
			pr.executeUpdate();

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

}
