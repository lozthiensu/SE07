package model.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.District;
import model.bean.Province;
import statics.SQLServer;

public class DistrictDAO {
	public ArrayList<District> getList(Province province) {

		// Open connect
		SQLServer.connect();

		ResultSet rs = null;
		ArrayList<District> districts = new ArrayList<District>();
		PreparedStatement pr = null;
		try {

			String sql = "select * from District where provinceId = ?";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, province.getProvinceId());
			rs = pr.executeQuery();
			while (rs.next()) {
				districts.add(new District(rs.getInt("districtId"), rs.getInt("provinceId"), rs.getString("name")));
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
		return districts;
	}
}
