package action.home;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.home.SearchThreadForm;
import model.bean.Thread;
import model.bo.ThreadBO;
import statics.Log;

public class SearchThreadAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SearchThreadForm searchThreadForm = (SearchThreadForm) form;
		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");
		PrintWriter out = response.getWriter();
		
		
		Thread thread = new Thread();
		ThreadBO threadBO = new ThreadBO();
		
		thread.setWifi(searchThreadForm.isWifi());
		thread.setWaterHeater(searchThreadForm.isWaterHeater());
		thread.setConditioner(searchThreadForm.isConditioner());
		
		ArrayList<Thread> threads = null;
		threads = threadBO.searchBy(thread);
		String result = "";
		for (Thread threadTemp : threads) {
			Log.in(threadTemp.toJSONString());
			if(result != "")
				result += ", ";
			result += threadTemp.toJSONString();
		}
		result = "[" + result + "]";
		out.println(result);
		
		
		out.flush();
		return null;
	}
}
