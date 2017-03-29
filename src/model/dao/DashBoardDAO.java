package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import model.bean.Category;
import model.bean.Chart;
import model.bean.ChartThreadRate;
import model.bean.DashBoard;
import statics.Log;
import statics.SQLServer;

public class DashBoardDAO {

	public DashBoard get() {

		// Open connect
		SQLServer.connect();

		ResultSet rs = null;
		DashBoard dashBoard = new DashBoard();
		PreparedStatement pr = null;

		try {

			/* ACCOUNT */
			String sql = "select count(accountId) as num from Account";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();
			if (rs.next()) {
				dashBoard.setNumOfAccount(rs.getInt("num"));
			}

			sql = "select count(accountId) as num from Account where status = 1";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();
			if (rs.next()) {
				dashBoard.setNumOfAccountActive(rs.getInt("num"));
			}
			dashBoard.setNumOfAccountLock(dashBoard.getNumOfAccount() - dashBoard.getNumOfAccountActive());
			dashBoard.setPerAccount(dashBoard.getNumOfAccountActive() * 100 / dashBoard.getNumOfAccount());
			/* ACCOUNT */

			/* THREAD */
			sql = "select count(threadId) as num from Thread";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();
			if (rs.next()) {
				dashBoard.setNumOfThread(rs.getInt("num"));
			}

			sql = "select count(threadId) as num from Thread where status = 1";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();
			if (rs.next()) {
				dashBoard.setNumOfThreadActive(rs.getInt("num"));
			}
			dashBoard.setNumOfThreadLock(dashBoard.getNumOfThread() - dashBoard.getNumOfThreadActive());
			dashBoard.setPerThread(dashBoard.getNumOfThreadActive() * 100 / dashBoard.getNumOfThread());
			/* THREAD */

			/* RATE */
			sql = "select count(rateId) as num from Rate";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();
			if (rs.next()) {
				dashBoard.setNumOfRate(rs.getInt("num"));
			}

			sql = "select count(rateId) as num from Rate where score = 5";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();
			if (rs.next()) {
				dashBoard.setNumOfRateMax(rs.getInt("num"));
			}
			try {
				dashBoard.setPerRate(dashBoard.getNumOfRateMax() * 100 / dashBoard.getNumOfRate());
			} catch (Exception e) {
			}
			/* THREAD */

			/* CHART THREAD */
			sql = "SELECT count(threadId) as num,  CAST(created AS DATE) as created FROM Thread WHERE created >= DATEADD(day,-7, GETDATE()) group by created";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();
			ArrayList<Chart> chartThread = new ArrayList<Chart>();
			while (rs.next()) {
				chartThread.add(new Chart(rs.getInt("num"), rs.getString("created")));
			}
			dashBoard.setChartThread(chartThread);
			/* CHART THREAD */

			/* CHART Rate */
			sql = " select top 10 count(rateId) as num, CAST(created AS DATE) as created from Rate WHERE created >= DATEADD(day,-7, GETDATE()) group by CAST(created AS DATE)";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();
			ArrayList<Chart> chartRate = new ArrayList<Chart>();
			while (rs.next()) {
				chartRate.add(new Chart(rs.getInt("num"), rs.getString("created")));
			}
			dashBoard.setChartRate(chartRate);
			/* CHART THREAD */

			LocalDate today = LocalDate.now();
			LocalDate yesterday = null;
			ArrayList<ChartThreadRate> chartThreadRates = new ArrayList<ChartThreadRate>();
			for (int i = 0; i < 7; i++) {
				yesterday = today.minusDays(i);
				chartThreadRates.add(new ChartThreadRate(yesterday.toString(), 0, 0));
			}
			int n = chartThreadRates.size();
			int m = chartThread.size();
			int o = chartRate.size();
			for (int i = 0; i < n; i++) {
				for (int j = 0; j < m; j++) {
					if(chartThreadRates.get(i).getLabel().equals(chartThread.get(j).getLabel()))
						chartThreadRates.get(i).setNum1(chartThread.get(j).getData());
				}

				for (int k = 0; k < o; k++) {
					if(chartThreadRates.get(i).getLabel().equals(chartRate.get(k).getLabel()))
						chartThreadRates.get(i).setNum2(chartRate.get(k).getData());
				}
			}
			dashBoard.setChartThreadRates(chartThreadRates);


			/* PIE THREAD */
			sql = "select temp.num, Category.name from Category inner join (select count(threadId) as num, categoryId from Thread group by categoryId) temp on temp.categoryId = Category.categoryId";
			pr = SQLServer.connection.prepareStatement(sql);
			rs = pr.executeQuery();
			ArrayList<Chart> pieThread = new ArrayList<Chart>();
			while (rs.next()) {
				pieThread.add(new Chart(rs.getInt("num"), rs.getString("name")));
			}
			dashBoard.setPieThread(pieThread);

			/* PIE THREAD */

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
		return dashBoard;
	}
}
