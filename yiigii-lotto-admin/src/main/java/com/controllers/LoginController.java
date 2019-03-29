package com.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entities.Admin;
import com.repositories.AdminRepository;

@Controller
public class LoginController extends BaseController {

	@Autowired
	private AdminRepository admin_rep;

	@GetMapping("/login")
	public Object login() {
		return "login/login";
	}

	@PostMapping("/login")
	public String login(HttpSession session, HttpServletRequest request, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		Admin active_user = admin_rep.findByUsernameAndPassword(username, password);
		if (active_user != null && active_user.getStatus().equals("active")) {
			root_action = request.getContextPath().toString();
			session.setAttribute("active_user", active_user);
			session.setAttribute("root_action", root_action);
			return_view = "redirect:user";
		} else {
			return_view = "redirect:login";
		}
		return return_view;
	}

}
