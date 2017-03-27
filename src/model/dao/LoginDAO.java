package model.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.bean.Login;
import statics.SQLServer;
import statics.Log;

public class LoginDAO {

	// Check login loginAccount
	public boolean checkLogin(Login loginAccount) {

		SQLServer.connect();
		ResultSet rs = null;
		PreparedStatement pr = null;
		boolean login = false;
		try {

			String sql = "select name from Account where email = ? AND password = ?";
			pr = SQLServer.connection.prepareStatement(sql);
			pr.setString(1, loginAccount.getEmail());
			pr.setString(2, loginAccount.getPassword());
			rs = pr.executeQuery();

			if (rs.next()) {// true
				login = true;
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

		return login;

	}

}
