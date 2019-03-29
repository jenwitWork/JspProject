package com.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.entities.User;

@Controller
public class MainController extends BaseController {

	@GetMapping("/main")
	public Object index(Model model, HttpSession session, HttpServletRequest request) {
		current_action = "main";
		current_title = "main";
		User active_user = (User) session.getAttribute("active_user");
		if (active_user != null)
			if (active_user.getStatus().equals("active")) {
				return_view = "main/index";
			} else {
				return_view = "main/check-money";
			}
		return auth.checkLogin(session, request, return_view);
	}

}
