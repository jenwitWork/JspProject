package com.controllers;

import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entities.Branch;
import com.entities.Page;
import com.entities.User;
import com.entities.UserBranch;
import com.entities.UserPage;
import com.repositories.BranchRepository;
import com.repositories.PageRepository;
import com.repositories.PositionRepository;
import com.repositories.UserBranchRepository;
import com.repositories.UserGroupRepository;
import com.repositories.UserPageRepository;
import com.repositories.UserRepository;
import com.utilities.EncodingPassword;

@Controller
public class UserController extends BaseController {

	@Autowired
	private UserRepository userRep;

	@Autowired
	private PositionRepository posRep;

	@Autowired
	private BranchRepository branchRep;

	@Autowired
	private UserGroupRepository ugRep;

	@Autowired
	private UserPageRepository userPageRep;

	@Autowired
	private PageRepository pageRep;

	@Autowired
	private UserBranchRepository userBranchRep;

	@GetMapping("/management/users")
	public Object index(Model model, HttpServletRequest request, HttpSession session) {
		current_action = "users";
		current_title = "Users";
		session.setAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("search_user", new User());
		model.addAttribute("posList", posRep.findAll());
		model.addAttribute("user_groups", ugRep.findAll());
		model.addAttribute("access_now", userPageRep.findUserAccess(current_branch, current_user, current_action));

		return auth.checkLogin(session, request, "management/user/index");
	}

	@GetMapping("/management/users/list")
	public Object list(@ModelAttribute("search_user") User form, Model model, HttpServletRequest request,
			HttpSession session) {
		model.addAttribute("users", userRep.search(form.getUsername().trim(), form.getName().trim(), current_branch,
				form.getPosId().trim(), form.getGroupId().trim(), form.getStatus().trim()));
		model.addAttribute("access_now", userPageRep.findUserAccess(current_branch, current_user, current_action));
		return new ModelAndView("management/user/_list");
	}

	@GetMapping("/management/users/view")
	public Object view() {

		return new ModelAndView("management/user/_view");
	}

	@GetMapping("/management/users/add")
	public Object add(Model model, HttpServletRequest request, HttpSession session) {
		current_action = "users";
		current_title = "User / Create";
		session.setAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("posList", posRep.findAll());
		model.addAttribute("branchList", branchRep.findAll());
		model.addAttribute("add_form", new User());

		UserPage userPage = userPageRep.findUserAccess(current_branch, current_user, current_action);

		if (userPage.getFlagAdd().equals("Y"))
			return new ModelAndView("management/user/_add");
		else
			return auth.checkLogin(session, request, "error/error_access");
	}

	@PostMapping("/management/users/add")
	@ResponseBody
	public String add(@ModelAttribute("add_form") User form) {
		try {
			form.setPassword(new EncodingPassword().getEncode(form.getPassword().trim()));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		form.setCreatedUser(current_user);
		form.setUpdatedUser(current_user);
		form.setCreatedDate(new Date());
		form.setUpdatedDate(new Date());
		form.setStatus("active");

		userRep.save(form);

		Iterable<Page> pages = pageRep.findAll();

		for (Page item : pages) {
			UserPage user_page = new UserPage();
			user_page.setBranchId(form.getBranchId());
			user_page.setPageName(item.getPageName());
			user_page.setUsername(form.getUsername());

			user_page.setCreatedDate(new Date());
			user_page.setCreatedUser(current_user);
			user_page.setUpdatedDate(new Date());
			user_page.setUpdatedUser(current_user);

			if (form.getGroupId().toUpperCase().equals("ADMINISTRATOR")) {
				user_page.setFlagAdd("Y");
				user_page.setFlagEdit("Y");
				user_page.setFlagDelete("Y");
				user_page.setFlagApprove("Y");
			} else {
				user_page.setFlagAdd("N");
				user_page.setFlagEdit("N");
				user_page.setFlagDelete("N");
				user_page.setFlagApprove("N");
			}

			userPageRep.save(user_page);

		}

		UserBranch ub = new UserBranch();
		ub.setBranchId(form.getBranchId());
		ub.setUsername(form.getUsername());
		ub.setCreatedDate(new Date());
		ub.setCreatedUser(current_user);
		ub.setUpdatedDate(new Date());
		ub.setUpdatedUser(current_user);
		userBranchRep.save(ub);

		return "success";
	}

	@GetMapping("/management/users/edit")
	public Object edit(@RequestParam("username") String username, Model model, HttpServletRequest request,
			HttpSession session) {
		current_action = "users";
		current_title = "User / Edit";

		User user = userRep.findOne(username.trim());
		Iterable<UserBranch> user_branchs = userBranchRep.findUsername(user.getUsername());

		session.setAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("posList", posRep.findAll());
		model.addAttribute("branchList", branchRep.findAll());
		model.addAttribute("edit_form", user);
		model.addAttribute("user_branchs", user_branchs);

		UserPage userPage = userPageRep.findUserAccess(current_branch, current_user, current_action);

		if (userPage.getFlagEdit().equals("Y"))
			return auth.checkLogin(session, request, "management/user/edit");
		else
			return auth.checkLogin(session, request, "error/error_access");

	}

	@PostMapping("/management/users/edit")
	@ResponseBody
	public String edit(@ModelAttribute("edit_form") User form) {
		User user = userRep.findOne(form.getUsername());
		// String old_branch_id = user.getBranchId();
		user.setName(form.getName());
		user.setDetail(form.getDetail());
		user.setBranchId(form.getBranchId());
		user.setPosId(form.getPosId());
		user.setGroupId(form.getGroupId());
		user.setStatus(form.getStatus());
		user.setUpdatedDate(new Date());
		user.setUpdatedUser(current_user);

		userRep.save(user);

		/*
		 * if (!old_branch_id.equals(form.getBranchId())) { List<UserBranch> new_branch
		 * = (List<UserBranch>) userBranchRep.find_branch_and_user(form.getBranchId(),
		 * form.getUsername()); if (new_branch.isEmpty())
		 * userBranchRep.updateBranchWhereUsername(form.getBranchId(), old_branch_id,
		 * user.getUsername()); }
		 */

		return "success";
	}

	@GetMapping("/management/users/delete")
	@ResponseBody
	public Object delete(Model model, @RequestParam("username") String username, HttpServletRequest request,
			HttpSession session) {
		User user = userRep.findOne(username.trim());
		model.addAttribute("form_delete", user);

		UserPage userPage = userPageRep.findUserAccess(current_branch, current_user, current_action);

		if (userPage.getFlagEdit().equals("Y"))
			return new ModelAndView("management/user/_delete");
		else
			return auth.checkLogin(session, request, "error/error_access");

	}

	@PostMapping("/management/users/delete")
	@ResponseBody
	public String delete(@ModelAttribute("form_delete") User form) {
		form = userRep.findOne(form.getUsername().trim());
		userRep.delete(form);
		userPageRep.deleteUsername(form.getUsername());
		userBranchRep.deleteUsername(form.getUsername());
		return "success";
	}

	@GetMapping("/management/users/check-dup")
	@ResponseBody
	public String checkDuplicate(@RequestParam("username") String username,
			@RequestParam("old_username") String old_username) {
		String return_value = "true";
		if (old_username.equals("") | old_username == null) {
			User pos = userRep.findOne(username.trim());
			if (pos == null)
				return_value = "true";
			else
				return_value = "false";
		} else {
			if (old_username.trim().equals(username.trim())) {
				return_value = "true";
			} else {
				User pos = userRep.findOne(username.trim());
				if (pos == null)
					return_value = "true";
				else
					return_value = "false";
			}
		}
		return return_value;
	}

	@GetMapping("/management/users/get-pages")
	@ResponseBody
	public Object get_page(@RequestParam("username") String username, @RequestParam("branch_id") String branch_id,
			Model model) {

		Iterable<UserPage> user_pages = userPageRep.find_branch_and_user(branch_id, username);
		model.addAttribute("user_pages", user_pages);
		model.addAttribute("branch_id", branch_id);
		model.addAttribute("username", username);

		return new ModelAndView("management/user/_user-branch");
	}

	@PostMapping("/management/users/add-pages")
	@ResponseBody
	public String add_page(@RequestParam("pageName") List<String> page_name,
			@RequestParam("flagAdd") List<String> flag_add, @RequestParam("flagEdit") List<String> flag_edit,
			@RequestParam("flagDelete") List<String> flag_delete,
			@RequestParam("flagApprove") List<String> flag_approve, @RequestParam("branchId") String branch_id,
			@RequestParam("username") String username) {

		userPageRep.deleteUsernameAndBranch(username, branch_id);

		for (int i = 0; i < page_name.size(); i++) {
			UserPage user_page = new UserPage();
			user_page.setBranchId(branch_id);
			user_page.setPageName(page_name.get(i));
			user_page.setUsername(username);

			user_page.setFlagAdd(flag_add.get(i));
			user_page.setFlagEdit(flag_edit.get(i));
			user_page.setFlagDelete(flag_delete.get(i));
			user_page.setFlagApprove(flag_approve.get(i));

			user_page.setCreatedDate(new Date());
			user_page.setCreatedUser(current_user);
			user_page.setUpdatedDate(new Date());
			user_page.setUpdatedUser(current_user);

			userPageRep.save(user_page);

		}

		return "success";
	}

	@GetMapping("/management/users/get-branch")
	@ResponseBody
	public Object get_branch(@RequestParam("branchId") List<String> branchId, @RequestParam("username") String username,
			Model model) {

		List<Branch> branchs = (List<Branch>) branchRep.findAll();

		for (int i = 0; i < branchs.size(); i++) {
			for (String item : branchId) {
				if (branchs.get(i).getBranchId().trim().equals(item.trim()))
					branchs.remove(i);
			}
		}

		model.addAttribute("branchs", branchs);
		model.addAttribute("username", username);

		return new ModelAndView("management/user/_add-branch");
	}

	@GetMapping("/management/users/delete-branch")
	@ResponseBody
	public Object delete_branch(Model model, @RequestParam("branchId") String branch_id,
			@RequestParam("username") String username) {
		model.addAttribute("branch_id", branch_id);
		model.addAttribute("username", username);
		return new ModelAndView("management/user/_delete-branch");
	}

	@PostMapping("/management/users/delete-branch")
	@ResponseBody
	public String delete_branch(@RequestParam("branchId") String branch_id, @RequestParam("username") String username,
			HttpSession session, HttpServletRequest request) {
		userPageRep.deleteUsernameAndBranch(username, branch_id);
		userBranchRep.deleteUsernameAndBranch(username, branch_id);
		allow_branch = userBranchRep.findUsername(current_user);
		session.setAttribute("allow_branch", allow_branch);
		return "success";
	}

	@GetMapping("/management/users/add-branch")
	@ResponseBody
	public String add_branch(@RequestParam("branch_id") String branch_id, @RequestParam("username") String username,
			HttpSession session, HttpServletRequest request) {

		// List<UserBranch> user_branchs = (List<UserBranch>)
		// userBranchRep.find_branch_and_user(branch_id, username);
		UserBranch user_branchs = userBranchRep.find_branch_and_user(branch_id, username);
		if (user_branchs == null) {
			Iterable<Page> pages = pageRep.findAll();

			for (Page item : pages) {
				UserPage user_page = new UserPage();
				user_page.setBranchId(branch_id);
				user_page.setPageName(item.getPageName());
				user_page.setUsername(username);

				user_page.setCreatedDate(new Date());
				user_page.setCreatedUser(current_user);
				user_page.setUpdatedDate(new Date());
				user_page.setUpdatedUser(current_user);

				user_page.setFlagAdd("N");
				user_page.setFlagEdit("N");
				user_page.setFlagDelete("N");
				user_page.setFlagApprove("N");

				userPageRep.save(user_page);

			}

			UserBranch ub = new UserBranch();
			ub.setBranchId(branch_id);
			ub.setUsername(username);
			ub.setCreatedDate(new Date());
			ub.setCreatedUser(current_user);
			ub.setUpdatedDate(new Date());
			ub.setUpdatedUser(current_user);
			userBranchRep.save(ub);

			allow_branch = userBranchRep.findUsername(current_user);
			session.setAttribute("allow_branch", allow_branch);

		}

		return "Success";
	}

}
