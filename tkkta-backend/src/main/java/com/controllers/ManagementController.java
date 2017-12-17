package com.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagementController extends BaseController {

	@GetMapping("/management")
	public String index() {
		return "redirect:/management/branch";
	}
	


}
