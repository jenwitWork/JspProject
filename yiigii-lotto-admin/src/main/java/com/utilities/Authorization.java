package com.utilities;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.controllers.BaseController;
import com.entities.User;

public class Authorization extends BaseController {

	private String ssId = null;

	@SuppressWarnings("null")
	public Object checkLogin(HttpSession session, HttpServletRequest request, String view_path) {
		if (request == null) {
			return_view = "redirect:login";
			return new RedirectView(request.getContextPath()+"/login");
		} else {
			session = request.getSession();
			ssId = session.getId().trim();
			User gobalUser = (User) session.getAttribute("gobalUser");
			if (ssId != null)
				if (gobalUser != null)
					return new ModelAndView(view_path);
				else
					return new RedirectView(request.getContextPath()+"/login");
			else
				return new RedirectView(request.getContextPath()+"/login");
		}
		//return return_view.trim();
	}

}