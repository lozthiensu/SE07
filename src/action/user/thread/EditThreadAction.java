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
import model.bean.Image;
import model.bean.Province;
import model.bean.Thread;
import model.bean.Village;
import model.bo.AccountBO;
import model.bo.CategoryBO;
import model.bo.DistrictBO;
import model.bo.ImageBO;
import model.bo.ProvinceBO;
import model.bo.ThreadBO;
import model.bo.VillageBO;
import statics.Log;

public class EditThreadAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		/* START CHECK LOGIN */
		Account account = new Account();
		AccountBO accountBO = new AccountBO();

		HttpSession httpSession = request.getSession();
		try {
			account.setEmail(httpSession.getAttribute("email").toString());
			account.setPassword(httpSession.getAttribute("password").toString());
		} catch (Exception e) {
			return mapping.findForward("failed");
		}
		Account accountData = accountBO.checkLoginAccount(account);
		if (accountData.getAccountId() > 0) {
			Gson gson = new Gson();
			String json = gson.toJson(accountData);
			httpSession.setAttribute("email", accountData.getEmail());
			httpSession.setAttribute("password", accountData.getPassword());
			accountData.setPassword("");
		} else {
			return mapping.findForward("edited");
		}
		/* END CHECK LOGIN */

		request.setCharacterEncoding("UTF-8");

		// BO object
		ThreadForm threadForm = (ThreadForm) form;
		ThreadBO threadBO = new ThreadBO();
		CategoryBO categoryBO = new CategoryBO();
		ProvinceBO provinceBO = new ProvinceBO();
		DistrictBO districtBO = new DistrictBO();
		VillageBO villageBO = new VillageBO();

		/* START CHECK THREAD OWNER */
		int threadId = threadForm.getThreadId();
		Thread thread = new Thread();
		thread.setThreadId(threadId);

		String action = action = threadForm.getAction();

		thread = threadBO.getById(thread);

		if (thread.getAccountId() != accountData.getAccountId()) {
			Log.in(thread.toString());
			Log.in(accountData.toString());
			return mapping.findForward("edited");
		}
		/* END CHECK THREAD OWNER */

		// Get provinces, districts, villages, categories
		threadForm.setCategories(categoryBO.getList());
		threadForm.setProvinces(provinceBO.getList());
		threadForm.setDistricts(new ArrayList<District>());
		threadForm.setVillages(new ArrayList<Village>());
		threadForm.setThreadId(threadId);
		Province province = new Province(thread.getProvinceId(), "");
		threadForm.setDistricts(districtBO.getList(province));
		District district = new District(thread.getDistrictId(), 0, "");
		threadForm.setVillages(villageBO.getList(district));
		ImageBO imageBO = new ImageBO();

		if ("submit".equals(action)) { // If press submit button
			ArrayList<Image> images = new ArrayList<Image>();
			String imagesString = threadForm.getImagesString();
			String[] imagesArr = imagesString.split(",");
			for (String string : imagesArr) {
				images.add(new Image(0, threadForm.getThreadId(), string, threadForm.getName(), false));
			}
			if (threadBO.edit(threadForm) == true) { // Delete all image old
				imageBO.delete(threadForm);
				imageBO.insert(images);
				return mapping.findForward("edited");
			}
			return mapping.findForward("edit");
		} else { // If don't press submit button

			ArrayList<Image> imagesTemp = imageBO.getListByThread(thread);
			String imagesStringTemp = "";
			for (Image image : imagesTemp) {
				if (imagesStringTemp != "")
					imagesStringTemp += ",";
				imagesStringTemp += image.getSrc().toString();
			}
			threadForm.setImagesString(imagesStringTemp);
			Log.in("Image: " + imagesStringTemp);

			/* START BRING TO FORM */
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
			/* END BRING TO FORM */

			return mapping.findForward("edit");
		}

	}
}
