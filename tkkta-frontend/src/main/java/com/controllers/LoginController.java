package com.controllers;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.entities.User;
import com.models.LoginForm;
import com.repositories.BranchRepository;
import com.repositories.UserBranchRepository;
import com.repositories.UserRepository;
import com.utilities.EncodingPassword;

@Controller
public class LoginController extends BaseController {

	@Autowired
	private UserRepository userRep;

	@Autowired
	private BranchRepository branchRep;
	
	@Autowired
	private UserBranchRepository userBranchRep;

	@GetMapping("/login")
	public String login(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		User gobalUser = (User) session.getAttribute("gobalUser");
		root_action = request.getContextPath().toString();
		model.addAttribute("lofin_form", new LoginForm());
		session.setAttribute("root_action", root_action);
		if (gobalUser != null)
			return "redirect:dashboard";
		else
			return "login/login";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute("login_form") LoginForm login_form, HttpSession session,
			HttpServletRequest request) throws NoSuchAlgorithmException {

		session = request.getSession();// create session

		login_form.setPassword(new EncodingPassword().getEncode(login_form.getPassword().trim()));

		User user = userRep.findByUsernameAndPassword(login_form.getUsername(), login_form.getPassword());
		if (user != null) {
			root_action = request.getContextPath().toString();
			current_user = user.getUsername().trim();
			current_branch = user.getBranchId();
			allow_branch = userBranchRep.findUsername(user.getUsername());
			session.setAttribute("gobalUser", user);
			session.setAttribute("menu_toggle", menu_toggle);
			session.setAttribute("root_action", root_action);
			session.setAttribute("current_branch", current_branch);
			session.setAttribute("allow_branch", allow_branch);
			session.setAttribute("gobalBranchList", branchRep.findAll());
			return_view = "redirect:document";
		} else {
			return_view = "redirect:login?error=false";
		}

		return return_view;

	}

}
