package model.bean;

public class Rate {
	int rateId;
	int threadId;
	int accountId;
	String created;
	String accountName;
	String accountImage;
	String content;
	int score;

	public Rate() {
		super();
	}

	public Rate(int rateId, int threadId, int accountId, String created, String accountName, String accountImage,
			String content, int score) {
		super();
		this.rateId = rateId;
		this.threadId = threadId;
		this.accountId = accountId;
		this.created = created;
		this.accountName = accountName;
		this.accountImage = accountImage;
		this.content = content;
		this.score = score;
	}

	public int getRateId() {
		return rateId;
	}

	public void setRateId(int rateId) {
		this.rateId = rateId;
	}

	public int getThreadId() {
		return threadId;
	}

	public void setThreadId(int threadId) {
		this.threadId = threadId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountImage() {
		return accountImage;
	}

	public void setAccountImage(String accountImage) {
		this.accountImage = accountImage;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Rate [rateId=" + rateId + ", threadId=" + threadId + ", accountId=" + accountId + ", created=" + created
				+ ", accountName=" + accountName + ", accountImage=" + accountImage + ", content=" + content
				+ ", score=" + score + "]";
	}

}
