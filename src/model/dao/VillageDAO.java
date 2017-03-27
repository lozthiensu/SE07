package model.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.District;
import model.bean.Province;
import model.bean.Village;
import statics.SQLServer;

public class VillageDAO {
	public ArrayList<Village> getList(District district) {
		// Open connect
		SQLServer.connect();

		ResultSet rs = null;
		ArrayList<Village> villages = new ArrayList<Village>();
		PreparedStatement pr = null;
		try {

			String sql = "select * from Village where districtId = ?";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setInt(1, district.getDistrictId());
			rs = pr.executeQuery();
			while (rs.next()) {
				villages.add(new Village(rs.getInt("villageId"), rs.getInt("districtId"), rs.getString("name")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // Close connect
			try {
				rs.close();
			} catch (Exception e) {
			}
			try {
				pr.close();
			} catch (Exception e) {
			}
			SQLServer.disconnect();
		}
		return villages;
	}

}
