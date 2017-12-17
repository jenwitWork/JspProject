package com.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Utilities extends BaseController {

	@GetMapping("/utilities/menu-toggle")
	@ResponseBody
	public String menuToggle(@RequestParam("menu_toggle") String toggle, HttpServletRequest request,
			HttpSession session) {
		if (toggle.equals("nav-sm"))
			menu_toggle = "nav-md";
		else
			menu_toggle = "nav-sm";
		session.setAttribute("menu_toggle", menu_toggle);
		return menu_toggle;
	}

}
