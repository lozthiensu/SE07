package action.user.thread;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import form.admin.account.AccountForm;
import form.user.thread.ThreadForm;
import model.bean.Account;
import model.bean.District;
import model.bean.Province;
import model.bean.Thread;
import model.bean.Village;
import model.bo.AccountBO;
import model.bo.CategoryBO;
import model.bo.DistrictBO;
import model.bo.ProvinceBO;
import model.bo.ThreadBO;
import model.bo.VillageBO;
import statics.Log;

public class EditThreadAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		
		Account account = new Account();
		AccountBO accountBO = new AccountBO(); 
		HttpSession httpSession = request.getSession();
		try {
			account.setEmail(httpSession.getAttribute("email").toString());
			account.setPassword(httpSession.getAttribute("password").toString());
		} catch (Exception e) {
			return mapping.findForward("failed");
		}
		//Log.in(account.toString());
		Account accountData = accountBO.checkLoginAccount(account);
		if (accountData.getAccountId() > 0) {
			//Log.in(accountData.toString());
			Gson gson = new Gson();
			String json = gson.toJson(accountData);
			httpSession.setAttribute("email", accountData.getEmail());
			httpSession.setAttribute("password", accountData.getPassword());
			accountData.setPassword("");
		} else {
			return mapping.findForward("edited");
		}	
		
		
		request.setCharacterEncoding("UTF-8");

		ThreadForm threadForm = (ThreadForm) form;

		ThreadBO threadBO = new ThreadBO();
		CategoryBO categoryBO = new CategoryBO();
		ProvinceBO provinceBO = new ProvinceBO();
		DistrictBO districtBO = new DistrictBO();
		VillageBO villageBO = new VillageBO();

		int threadId = threadForm.getThreadId(); 
		Thread thread = new Thread();
		thread.setThreadId(threadId);

		String action = action = threadForm.getAction();

		thread = threadBO.getById(thread);
		if(thread.getAccountId() != accountData.getAccountId()){
			Log.in("Bai viet khong thuoc quyen cua ban");
			Log.in(thread.toString());
			Log.in(accountData.toString());
			return mapping.findForward("edited");
		}
		
		
		threadForm.setCategories(categoryBO.getList());
		threadForm.setProvinces(provinceBO.getList());
		threadForm.setDistricts(new ArrayList<District>());
		threadForm.setVillages(new ArrayList<Village>());
		threadForm.setThreadId(threadId);

		if ("submit".equals(action)) {
			Log.in(threadForm.isWifi() + " Wifi");
			if (threadBO.edit(threadForm) == true) {
				Log.in("Dem di sua: " + threadForm.toString());
				return mapping.findForward("edited");
			}

			Log.in("Sua that bai");
			return mapping.findForward("edit");
		} else {

			/* DUA LEN FORM */
			threadForm.setThreadId(threadId);
			threadForm.setCategoryId(thread.getCategoryId());
			threadForm.setAccountId(thread.getAccountId());
			threadForm.setName(thread.getName());
			threadForm.setAddress(thread.getAddress());
			threadForm.setLatitude(thread.getLatitude());
			threadForm.setLongitude(thread.getLongitude());
			threadForm.setContent(thread.getContent());
			threadForm.setPrice(thread.getPrice());
			threadForm.setElectricFee(thread.getElectricFee());
			threadForm.setWaterFee(thread.getWaterFee());

			threadForm.setWifi(thread.isWifi());
			threadForm.setWaterHeater(thread.isWaterHeater());
			threadForm.setConditioner(thread.isConditioner());
			threadForm.setFridge(thread.isFridge());
			threadForm.setAttic(thread.isAttic());
			threadForm.setCamera(thread.isCamera());

			threadForm.setWaterSource(thread.getWaterSource());
			threadForm.setDirection(thread.getDirection());
			threadForm.setNumOfToilets(thread.getNumOfToilets());
			threadForm.setNumOfPeople(thread.getNumOfPeople());
			threadForm.setObject(thread.getObject());
			threadForm.setVillageId(thread.getVillageId());
			threadForm.setCreated(thread.getCreated());
			threadForm.setViewed(thread.getViewed());
			threadForm.setStatus(thread.getStatus());
			threadForm.setImageThumb(thread.getImageThumb());
			threadForm.setDistrictId(thread.getDistrictId());
			threadForm.setProvinceId(thread.getProvinceId());
			threadForm.setArea(thread.getArea());
			threadForm.setOtherFee(thread.getOtherFee());

			threadForm.setKindOf(thread.isKindOf());
			Province province = new Province(thread.getProvinceId(), "");
			Log.in(province.toString());
			threadForm.setDistricts(districtBO.getList(province));

			District district = new District(thread.getDistrictId(), 0, "");
			Log.in(district.toString());
			threadForm.setVillages(villageBO.getList(district));

			Log.in("Doc ra: " + threadForm.toString());
			return mapping.findForward("edit");
		}

	}
}
