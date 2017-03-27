package model.bo;

import java.util.ArrayList;

import model.bean.Notification;
import model.dao.NotificationDAO;

public class NotificationBO {
	NotificationDAO notificationDAO = new NotificationDAO();

	public ArrayList<Notification> getListByAccount(int accountId) {
		return notificationDAO.getListByAccount(accountId);
	}
	public boolean read(int notificationId, int accountId) {
		return notificationDAO.read(notificationId, accountId);
	}
	public boolean add(Notification notification){
		return notificationDAO.add(notification);
	}
	
}
