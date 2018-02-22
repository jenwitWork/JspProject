package com.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashbaordController extends BaseController {

	@GetMapping("/dashboard")
	public Object dashbaord(Model model, HttpServletRequest request, HttpSession session) {
		current_action = "Dashboard";
		current_title = "Dashboard";
		model.addAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);

		return auth.checkLogin(session, request, "dashboard/dashboard");
	}

}
