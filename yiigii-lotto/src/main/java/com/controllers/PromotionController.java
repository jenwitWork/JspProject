package com.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PromotionController extends BaseController {

	@GetMapping("/promotion")
	public Object index(HttpSession session, HttpServletRequest request) {
		current_action = "promotion";
		current_title = "promotion";
		session.setAttribute("current_action", current_action);
		session.setAttribute("current_title", current_title);

		return "promotion/index";
	}

}
