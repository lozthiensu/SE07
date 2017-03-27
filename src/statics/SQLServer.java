package statics;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLServer {

	public static String url = "jdbc:sqlserver://localhost:1433;databaseName=QLPT1";
	public static String userName = "sa";
	public static String password = "123";

	public static Connection connection;

	public static void connect() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager.getConnection(url, userName, password);
			// System.out.println("Ket noi thanh cong");
		} catch (SQLException e) {
			e.printStackTrace();
			// System.out.println("Ket noi loi");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			// System.out.println("JDBC loi");
		}
	}

	public static void disconnect() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
