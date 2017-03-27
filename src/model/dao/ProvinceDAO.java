package model.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Image;
import model.bean.Province;
import model.bean.Thread;
import statics.SQLServer;

public class ProvinceDAO {

	public ArrayList<Province> getList() {

		// Open SQLServer.connect
		SQLServer.connect();

		ResultSet rs = null;
		ArrayList<Province> provinces = new ArrayList<Province>();
		PreparedStatement pr = null;
		try {
			String sql = "select * from Province";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();
			while (rs.next()) {
				provinces.add(new Province(rs.getInt("provinceId"), rs.getString("name")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // Close SQLServer.connect
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

		return provinces;
	}

}
