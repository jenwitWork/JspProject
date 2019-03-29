package com.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.entities.Admin;
import com.repositories.AdminRepository;

@Controller
public class ContactController extends BaseController {

	@Autowired
	private AdminRepository admin_rep;

	@GetMapping("/contact")
	public Object index(Model model, HttpSession session, HttpServletRequest request) {
		current_action = "contact";
		current_title = "contact";
		session.setAttribute("current_action", current_action);
		session.setAttribute("current_title", current_title);
		
		List<Admin> admin_list = (List<Admin>) admin_rep.findAll();
		model.addAttribute("admin_list", admin_list);
		return "contact/index";
	}

}
