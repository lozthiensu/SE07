package model.bean;

import java.util.ArrayList;

public class ThreadAutoCompleteSuggestion {

	ArrayList<ThreadAutoCompleteItem> suggestions;

	public ThreadAutoCompleteSuggestion() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ThreadAutoCompleteSuggestion(ArrayList<ThreadAutoCompleteItem> suggestions) {
		super();
		this.suggestions = suggestions;
	}

	public ArrayList<ThreadAutoCompleteItem> getSuggestions() {
		return suggestions;
	}

	public void setSuggestions(ArrayList<ThreadAutoCompleteItem> suggestions) {
		this.suggestions = suggestions;
	}

}
