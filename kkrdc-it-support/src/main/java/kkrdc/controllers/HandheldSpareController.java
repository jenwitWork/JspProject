package kkrdc.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HandheldSpareController extends BaseController {

	@GetMapping("/handheld-spare")
	public String handheld(Model model) {
		current_title = "Handheld-spare";
		current_url = "handheld";
		model.addAttribute("current_title", current_title);
		model.addAttribute("current_url", current_url);
		return "handheld/handheld-spare";
	}

}
