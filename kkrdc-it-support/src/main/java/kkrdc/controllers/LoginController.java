package kkrdc.controllers;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kkrdc.entities.User;
import kkrdc.repositories.UserRepository;
import kkrdc.utilities.EncodingPassword;
import kkrdc.model.LoginForm;

@Controller
public class LoginController extends BaseController {

	@Autowired
	private UserRepository userRep;

	@GetMapping("/login")
	public String login(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		User gobalUser = (User) session.getAttribute("gobalUser");
		model.addAttribute("lofin_form", new LoginForm());
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

		User userProfile = userRep.findByUsernameAndPassword(login_form.getUsername(), login_form.getPassword());
		if (userProfile != null) {
			session.setAttribute("gobalUser", userProfile);
			session.setAttribute("gobal_dc_tag", userProfile.getDcType().trim());
			session.setAttribute("menu_toggle", menu_toggle);
			return_view = "redirect:dashboard";
		} else {
			return_view = "redirect:login?error=false";
		}

		return return_view;

	}

}
