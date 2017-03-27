package form.mod.thread;

import org.apache.struts.action.ActionForm;

public class VerifyThreadForm extends ActionForm {
	int threadId = 0;

	public VerifyThreadForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public VerifyThreadForm(int threadId) {
		this.threadId = threadId;
	}

	public int getThreadId() {
		return threadId;
	}

	public void setThreadId(int threadId) {
		this.threadId = threadId;
	}

}
