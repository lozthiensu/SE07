package form.home;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Rate;

public class RateHomeForm extends ActionForm {
	int rateId;
	int threadId;
	int accountId;
	int accountEmail; 
	String created;
	String accountName;
	String accountImage;
	String content;
	int score; 
	String email; 
	String password; 

	String action;

	public RateHomeForm() {
		super(); 
	}

	public RateHomeForm(int rateId, int threadId, int accountId, int accountEmail, String created, String accountName,
			String accountImage, String content, int score, String action) {
		super();
		this.rateId = rateId;
		this.threadId = threadId;
		this.accountId = accountId;
		this.accountEmail = accountEmail;
		this.created = created;
		this.accountName = accountName;
		this.accountImage = accountImage;
		this.content = content;
		this.score = score;
		this.action = action;
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

	public int getAccountEmail() {
		return accountEmail;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setAccountEmail(int accountEmail) {
		this.accountEmail = accountEmail;
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

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}
	
}
