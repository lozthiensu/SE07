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

import form.user.thread.ThreadForm;
import model.bean.Account;
import model.bean.District;
import model.bean.Image;
import model.bean.Notification;
import model.bean.Province;
import model.bean.Thread;
import model.bean.Village;
import model.bo.AccountBO;
import model.bo.CategoryBO;
import model.bo.DistrictBO;
import model.bo.ImageBO;
import model.bo.NotificationBO;
import model.bo.ProvinceBO;
import model.bo.ThreadBO;
import model.bo.VillageBO;
import statics.Log;

public class AddThreadAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		/* CHECK LOGIN */
		Account account = new Account();
		AccountBO accountBO = new AccountBO();
		HttpSession httpSession = request.getSession();
		try {
			account.setEmail(httpSession.getAttribute("email").toString());
			account.setPassword(httpSession.getAttribute("password").toString());
			account = accountBO.checkLoginAccount(account);
			if (account.getAccountId() > 0) {
				httpSession.setAttribute("email", account.getEmail());
				httpSession.setAttribute("password", account.getPassword());
				account.setPassword("");
			} else {
				return mapping.findForward("success");
			}
		} catch (Exception e) {
			return mapping.findForward("failed");
		}
		/* CHECK LOGIN */

		request.setCharacterEncoding("UTF-8");

		ThreadBO threadBO = new ThreadBO();
		CategoryBO categoryBO = new CategoryBO();
		ProvinceBO provinceBO = new ProvinceBO();
		DistrictBO districtBO = new DistrictBO();
		VillageBO villageBO = new VillageBO();
		ImageBO imageBO = new ImageBO();
		NotificationBO notificationBO = new NotificationBO();

		ThreadForm threadForm = (ThreadForm) form;
		Thread thread = new Thread();

		String action = action = threadForm.getAction();

		threadForm.setAccountId(account.getAccountId());
		threadForm.setCategories(categoryBO.getList());
		threadForm.setProvinces(provinceBO.getList());
		threadForm.setDistricts(new ArrayList<District>());
		threadForm.setVillages(new ArrayList<Village>());

		Province province = new Province(threadForm.getProvinceId(), "");
		threadForm.setDistricts(districtBO.getList(province));

		District district = new District(threadForm.getDistrictId(), 0, "");
		threadForm.setVillages(villageBO.getList(district));

		if ("submit".equals(action)) {
			int threadId = threadBO.add(threadForm);
			if (threadId > 0) {
				ArrayList<Thread> threads = new ArrayList<Thread>();
				if(threadForm.isSendNotification() == true){
					threads = threadBO.searchByAdd(threadForm);
					for (Thread thread2 : threads) {
						String content = "<b>" + account.getName() + "</b> đã đánh đăng bài phù hợp với bài viết của bạn";
						Notification notification = new Notification(0, threadId, 0,
								thread2.getAccountId(), content, "", "", false);
						notification.setAccountIdPush(account.getAccountId());
						notificationBO.add(notification);
					}
				}
				ArrayList<Image> images = new ArrayList<Image>();
				String imagesString = threadForm.getImagesString();
				String[] imagesArr = imagesString.split(",");
				for (String string : imagesArr) {
					images.add(new Image(0, threadId, string, threadForm.getName(), false));
				}
				imageBO.insert(images);
				return mapping.findForward("success");
			}
			return mapping.findForward("failed");
		} else {
			return mapping.findForward("failed");
		}
	}
}
