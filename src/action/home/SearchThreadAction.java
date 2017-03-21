package action.home;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import form.home.SearchThreadForm;
import jdk.nashorn.internal.parser.JSONParser;
import model.bean.District;
import model.bean.Province;
import model.bean.Thread;
import model.bean.ThreadAutoCompleteItem;
import model.bean.ThreadAutoCompleteSuggestion;
import model.bean.Village;
import model.bo.DistrictBO;
import model.bo.ThreadBO;
import model.bo.VillageBO;
import statics.Log;

public class SearchThreadAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		SearchThreadForm searchThreadForm = (SearchThreadForm) form;
		response.setContentType("text/text;charset=utf-8");
		response.setHeader("cache-control", "no-cache");

		String action = "";
		int page = 1;
		try {
			page = searchThreadForm.getPage();
			action = searchThreadForm.getAction();
			Log.in("Action: " + action + ", page: " + page + ", name: " + searchThreadForm.getName());
		} catch (Exception e) {
			Log.in("Post that bai");
		}
		if (action == null) {
			return null;
		} else if (action.equals("search")) {

			PrintWriter out = response.getWriter();

			Thread thread = new Thread();
			ThreadBO threadBO = new ThreadBO();

			thread.setWifi(searchThreadForm.isWifi());
			thread.setWaterHeater(searchThreadForm.isWaterHeater());
			thread.setConditioner(searchThreadForm.isConditioner());
			thread.setFridge(searchThreadForm.isFridge());
			thread.setAttic(searchThreadForm.isAttic());
			thread.setCamera(searchThreadForm.isCamera());
			thread.setObject(searchThreadForm.getObject());
			thread.setWaterSource(searchThreadForm.getWaterSource());
			thread.setFar(searchThreadForm.getFar());
			thread.setLatitude(searchThreadForm.getLat());
			thread.setLongitude(searchThreadForm.getLng());
			thread.setArea(searchThreadForm.getArea());
			thread.setPrice(searchThreadForm.getPrice());
			thread.setProvince(new Province(searchThreadForm.getProvinceId(), ""));
			thread.setDistrict(new District(searchThreadForm.getDistrictId(), 0, ""));
			thread.setVillage(new Village(searchThreadForm.getVillageId(), 0, ""));
			thread.setName(searchThreadForm.getName());

			//Log.in(thread);
			//Log.in(thread.toString());
			ArrayList<Thread> threads = new ArrayList<Thread>();
			threads = threadBO.searchBy(thread, page);

			Gson gson = new Gson();
			String json = gson.toJson(threads);
			// Log.in(json);
			out.println(json);
			out.flush();
			// System.out.println(json);

		} else if (action.equals("autocomplete")) {
			Log.in("Dang autocomplete: " + searchThreadForm.getName());
			PrintWriter out = response.getWriter();

			Thread thread = new Thread();
			ThreadBO threadBO = new ThreadBO();

			thread.setWifi(searchThreadForm.isWifi());
			thread.setWaterHeater(searchThreadForm.isWaterHeater());
			thread.setConditioner(searchThreadForm.isConditioner());
			thread.setFridge(searchThreadForm.isFridge());
			thread.setAttic(searchThreadForm.isAttic());
			thread.setCamera(searchThreadForm.isCamera());
			thread.setObject(searchThreadForm.getObject());
			thread.setWaterSource(searchThreadForm.getWaterSource());
			thread.setFar(searchThreadForm.getFar());
			thread.setLatitude(searchThreadForm.getLat());
			thread.setLongitude(searchThreadForm.getLng());
			thread.setArea(searchThreadForm.getArea());
			thread.setPrice(searchThreadForm.getPrice());
			thread.setProvince(new Province(searchThreadForm.getProvinceId(), ""));
			thread.setDistrict(new District(searchThreadForm.getDistrictId(), 0, ""));
			thread.setVillage(new Village(searchThreadForm.getVillageId(), 0, ""));
			thread.setName(searchThreadForm.getName());

			//Log.in(thread);
			Log.in(thread.toString());
			ArrayList<Thread> threads = new ArrayList<Thread>();
			threads = threadBO.searchBy(thread, page);

			ArrayList<ThreadAutoCompleteItem> threadAutoCompleteItems = new ArrayList<ThreadAutoCompleteItem>();
			ThreadAutoCompleteSuggestion threadAutoCompleteSuggestion = new ThreadAutoCompleteSuggestion();

			for (Thread threadItem : threads) {
				threadAutoCompleteItems.add(new ThreadAutoCompleteItem(threadItem.getName(), threadItem.getName()));
			}

			threadAutoCompleteSuggestion.setSuggestions(threadAutoCompleteItems);

			Gson gson = new Gson();
			String json = gson.toJson(threadAutoCompleteSuggestion);
			Log.in(json);
			out.println(json);
			out.flush();
			System.out.println(json);
			if (threads.size() == 0) {
				Log.in("Rong ne: ");
				System.out.println(json);
			}

		} else if (action.equals("getDistrict")) {

			PrintWriter out = response.getWriter();

			Province province = new Province(searchThreadForm.getProvinceId(), "");

			ArrayList<District> districts = new ArrayList<District>();
			DistrictBO districtBO = new DistrictBO();
			districts = districtBO.getList(province);

			Gson gson = new Gson();
			String json = gson.toJson(districts);

			out.println(json);
			out.flush();
			// System.out.println(json);

		} else if (action.equals("getVillage")) {

			PrintWriter out = response.getWriter();

			District district = new District(searchThreadForm.getDistrictId(), 0, "");

			ArrayList<Village> villages = new ArrayList<Village>();
			VillageBO villageBO = new VillageBO();
			villages = villageBO.getList(district);

			Gson gson = new Gson();
			String json = gson.toJson(villages);

			out.println(json);
			out.flush();
			// System.out.println(json);

		}
		return null;
	}
}
