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
public class LoginController extends BaseController {

	@Autowired
	private UserRepository user_rep;

	@GetMapping("/login")
	public Object login() {
		return "login/login";
	}

	@PostMapping("/login")
	public String login(HttpSession session, HttpServletRequest request, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		User active_user = user_rep.findByUsernameAndPassword(username, password);
		if (active_user != null) {
			root_action = request.getContextPath().toString();
			session.setAttribute("active_user", active_user);
			session.setAttribute("root_action", root_action);
			return_view = "redirect:main";
		} else {
			return_view = "redirect:login";
		}
		return return_view;
	}

	@GetMapping("/register")
	public String register() {
		return "login/register";
	}

	@PostMapping("/register")
	public String register(@RequestParam("username") String username, @RequestParam("password") String password) {
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setStatus("inactive");
		
		user_rep.save(user);
		
		return "login/success";
	}
	
	@GetMapping("/register/check-dup")
	@ResponseBody
	public String checkDup(@RequestParam("username") String username) {
		String return_value = "false";
		User user = user_rep.findOne(username.trim());
		if(user != null)
			return_value = "false";
		else
			return_value = "true";
		return return_value;
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		if (session != null) {
			session.removeAttribute("active_user");
		}
		return "redirect:login";
	}

}
