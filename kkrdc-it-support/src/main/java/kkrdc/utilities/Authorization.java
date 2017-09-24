package kkrdc.utilities;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kkrdc.controllers.BaseController;
import kkrdc.entities.User;

public class Authorization extends BaseController {

	private String ssId = null;

	public String checkLogin(HttpSession session, HttpServletRequest request, String view_path) {
		if (request == null) {
			return_view = "redirect:login";
		} else {
			session = request.getSession();
			ssId = session.getId().trim();
			User gobalUser = (User) session.getAttribute("gobalUser");
			if (ssId != null)
				if (gobalUser != null)
					return_view = view_path;
				else
					return_view = "redirect:login";
			else
				return_view = "redirect:login";
		}
		return return_view.trim();
	}

}
