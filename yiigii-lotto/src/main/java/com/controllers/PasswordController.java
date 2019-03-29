package com.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entities.User;
import com.repositories.UserRepository;

@Controller
public class PasswordController extends BaseController {

	@Autowired
	private UserRepository user_rep;

	@GetMapping("/change-pass")
	public Object index(HttpSession session, HttpServletRequest request) {
		current_action = "password";
		current_title = "password";
		session.setAttribute("current_action", current_action);
		session.setAttribute("current_title", current_title);
		return auth.checkLogin(session, request, "password/index");
	}

	@PostMapping("/change-pass")
	public String index(@RequestParam("new_password") String new_password, HttpSession session,
			HttpServletRequest request) {

		User active_user = (User) session.getAttribute("active_user");
		if (active_user != null) {
			active_user.setPassword(new_password);
			user_rep.save(active_user);
		}

		return "password/success";
	}
	
	@GetMapping("/change-pass/check-dup")
	@ResponseBody
	public String checkDup(@RequestParam("username") String username,@RequestParam("password") String password) {
		String return_value = "false";
		User user = user_rep.findByUsernameAndPassword(username, password);
		if(user == null)
			return_value = "false";
		else
			return_value = "true";
		return return_value;
	}

}