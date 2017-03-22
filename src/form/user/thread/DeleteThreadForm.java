package form.user.thread;

import org.apache.struts.action.ActionForm;

public class DeleteThreadForm extends ActionForm {
	int threadId = 0;

	public DeleteThreadForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DeleteThreadForm(int threadId) {
		super();
		this.threadId = threadId;
	}

	public int getThreadId() {
		return threadId;
	}

	public void setThreadId(int threadId) {
		this.threadId = threadId;
	}

}
