package form.mod.account;

import org.apache.struts.action.ActionForm;

public class ModAccountForm extends ActionForm {
	int accountId;

	public ModAccountForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ModAccountForm(int accountId) {
		this.accountId = accountId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

}
