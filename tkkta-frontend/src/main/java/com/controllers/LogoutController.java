package com.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LogoutController {

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		if (session != null) {
			session.removeAttribute("gobalUser");
		}
		return "redirect:login";
	}

}
