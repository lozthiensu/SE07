package form.admin.category;

import org.apache.struts.action.ActionForm;

public class DeleteCategoryForm extends ActionForm {
	private int categoryId;

	public DeleteCategoryForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DeleteCategoryForm(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

}
