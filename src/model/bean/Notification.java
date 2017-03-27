package model.bean;

public class Notification {
	int notificationId;
	int threadId;
	int rateId;
	int accountId;
	int accountIdPush;
	String content;
	String created;
	String timeCount;
	String avatar;
	boolean bit;

	public Notification() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notification(int notificationId, int threadId, int rateId, int accountId, String content, String created,
			String timeCount, boolean bit) {
		super();
		this.notificationId = notificationId;
		this.threadId = threadId;
		this.rateId = rateId;
		this.accountId = accountId;
		this.content = content;
		this.created = created;
		this.timeCount = timeCount;
		this.bit = bit;
	}

	public int getNotificationId() {
		return notificationId;
	}

	public void setNotificationId(int notificationId) {
		this.notificationId = notificationId;
	}

	public int getThreadId() {
		return threadId;
	}

	public void setThreadId(int threadId) {
		this.threadId = threadId;
	}

	public int getRateId() {
		return rateId;
	}

	public void setRateId(int rateId) {
		this.rateId = rateId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getTimeCount() {
		return timeCount;
	}

	public void setTimeCount(String timeCount) {
		this.timeCount = timeCount;
	}

	public boolean isBit() {
		return bit;
	}

	public void setBit(boolean bit) {
		this.bit = bit;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public int getAccountIdPush() {
		return accountIdPush;
	}

	public void setAccountIdPush(int accountIdPush) {
		this.accountIdPush = accountIdPush;
	}

	@Override
	public String toString() {
		return "Notification [notificationId=" + notificationId + ", threadId=" + threadId + ", rateId=" + rateId
				+ ", accountId=" + accountId + ", content=" + content + ", created=" + created + ", timeCount="
				+ timeCount + ", avatar=" + avatar + ", bit=" + bit + "]";
	}

}
