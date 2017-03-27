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

	public ArrayList<Image> getListByThread(Thread thread) {

		// Open connect
		SQLServer.connect();

		ResultSet rs = null;
		ArrayList<Image> images = new ArrayList<Image>();
		PreparedStatement pr = null;

		try {

			// Select
			String sql = "select * from Image where threadId = ? and image360 = 0";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, thread.getThreadId());
			rs = pr.executeQuery();
			while (rs.next()) {
				images.add(new Image(rs.getInt("imageId"), rs.getInt("threadId"), rs.getString("src"),
						rs.getString("content"), rs.getBoolean("image360")));
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
		return images;
	}

	public ArrayList<Image> getList360ByThread(Thread thread) {

		// Open connect
		SQLServer.connect();

		ResultSet rs = null;
		ArrayList<Image> images = new ArrayList<Image>();
		PreparedStatement pr = null;

		try {

			String sql = "select * from Image where threadId = ? and image360 = 1";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, thread.getThreadId());
			rs = pr.executeQuery();

			while (rs.next()) {
				images.add(new Image(rs.getInt("imageId"), rs.getInt("threadId"), rs.getString("src"),
						rs.getString("content"), rs.getBoolean("image360")));
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
		return images;
	}

	public boolean delete(ThreadForm threadForm) {

		// Open connect
		SQLServer.connect();

		ResultSet rs = null;
		ArrayList<Image> images = new ArrayList<Image>();
		PreparedStatement pr = null;
		int count = 0;
		try {

			String sql = "delete from Image where threadId = ?";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, threadForm.getThreadId());
			count = pr.executeUpdate();

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

		return count > 0 ? true : false;

	}

	public boolean insert(ArrayList<Image> images) {

		// Open connect
		SQLServer.connect();

		ResultSet rs = null;
		PreparedStatement pr = null;
		int count = 0;
		try {

			for (Image image : images) {
				String sql = "insert into Image(threadId, src, content, image360) VALUES(?,?,?,?)";
				pr = SQLServer.connection.prepareStatement(sql);
				pr.setInt(1, image.getThreadId());
				pr.setString(2, image.getSrc());
				pr.setString(3, image.getContent());
				pr.setBoolean(4, false);
				count = pr.executeUpdate();
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
		return count > 0 ? true : false;
	}
}
