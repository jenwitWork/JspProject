package hotel.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import hotel.service.UsersService;

@Controller
public class HomeController {

	@Autowired
	private UsersService usersSer;

	@GetMapping("/home")
	public String home() {
		return "home/index";
	}

	@GetMapping("/all-users")
	public String allUsers(HttpServletRequest request) {
		request.setAttribute("users", usersSer.findAll().toString());
		return "home/all-users";
	}

}
