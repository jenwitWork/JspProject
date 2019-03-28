package com.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController extends BaseController {

	@GetMapping("/user")
	public Object index(Model model, HttpSession session, HttpServletRequest request) {
		current_action = "users";
		current_title = "Users";
		
		return auth.checkLogin(session, request, "user/index");
	}

}
