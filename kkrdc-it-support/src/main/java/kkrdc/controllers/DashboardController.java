package kkrdc.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController extends BaseController {

	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session, HttpServletRequest request) {
		current_title = "Dashboard";
		current_url = "dashboard";
		model.addAttribute("current_title", current_title);
		model.addAttribute("current_url", current_url);
		return auth.checkLogin(session, request, "dashboard/dashboard");
	}

}
