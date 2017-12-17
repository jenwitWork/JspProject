package com.controllers;

import java.util.Date;

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
import com.entities.UserBranch;
import com.repositories.BranchRepository;
import com.repositories.DocumentRepository;
import com.repositories.UserBranchRepository;
import com.repositories.UserPageRepository;
import com.repositories.UserRepository;

@Controller
public class BranchController extends BaseController {

	@Autowired
	private BranchRepository branchRep;

	@Autowired
	private DocumentRepository docRep;

	@Autowired
	private UserRepository userRep;

	@Autowired
	private UserPageRepository userPageRep;

	@Autowired
	private UserBranchRepository userBranchRep;

	@GetMapping("/management/branch")
	public Object branch(Model model, HttpServletRequest request, HttpSession session) {
		current_action = "branch";
		current_title = "Branch";
		model.addAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("search_form", new Branch());

		return auth.checkLogin(session, request, "management/branch/index");
	}

	@GetMapping("/management/branch/list")
	public Object list(@ModelAttribute("search_form") Branch search, Model model) {

		Iterable<Branch> branchs = branchRep.search(search.getBranchId().trim(), search.getBranchName().trim());
		model.addAttribute("branchs", branchs);

		return new ModelAndView("management/branch/_list");
	}

	@GetMapping("/management/branch/create")
	public Object create(Model model, HttpServletRequest request, HttpSession session) {

		model.addAttribute("create_form", new Branch());

		return new ModelAndView("management/branch/_create");
	}

	@PostMapping("/management/branch/create")
	@ResponseBody
	public String create(@ModelAttribute("create_form") Branch form) {

		form.setCreatedDate(new Date());
		form.setCreatedUser(current_user);
		form.setUpdatedDate(new Date());
		form.setUpdatedUser(current_user);

		branchRep.save(form);

		return "success";
	}

	@GetMapping("/management/branch/edit")
	public Object edit(@RequestParam("branch_id") String branch_id, Model model, HttpServletRequest request,
			HttpSession session) {

		Branch branch = branchRep.findOne(branch_id.trim());
		model.addAttribute("edit_form", branch);

		return new ModelAndView("management/branch/_edit");
	}

	@PostMapping("/management/branch/edit")
	@ResponseBody
	public String edit(@ModelAttribute("edit_form") Branch form, @RequestParam("old_branch_id") String old_branch_id) {

		Branch branch = branchRep.findOne(old_branch_id.trim());

		if (old_branch_id.trim().equals(form.getBranchId().trim())) {
			branch.setBranchName(form.getBranchName().trim());
			branch.setUpdatedDate(new Date());
			branch.setUpdatedUser(current_user.trim());

			branchRep.save(branch);
		} else {
			if (branch != null)
				branchRep.delete(branch);

			form.setCreatedDate(new Date());
			form.setCreatedUser(current_user.trim());
			form.setUpdatedDate(new Date());
			form.setUpdatedUser(current_user.trim());

			branchRep.save(form);

			docRep.updateBranch(form.getBranchId(), old_branch_id);
			userRep.updateBranch(form.getBranchId(), old_branch_id);
			userPageRep.updateBranch(form.getBranchId(), old_branch_id);
			userBranchRep.updateBranch(form.getBranchId(), old_branch_id);
		}

		return "success";
	}

	@GetMapping("/management/branch/delete")
	public Object delete(@RequestParam("branch_id") String branch_id, Model model, HttpServletRequest request,
			HttpSession session) {

		Branch branch = branchRep.findOne(branch_id.trim());
		model.addAttribute("delete_form", branch);

		return new ModelAndView("management/branch/_delete");
	}

	@PostMapping("/management/branch/delete")
	@ResponseBody
	public String delete(@ModelAttribute("delete_form") Branch form, HttpServletRequest request, HttpSession session) {
		form = branchRep.findOne(form.getBranchId().trim());
		branchRep.delete(form);
		userBranchRep.deleteBranch(form.getBranchId());
		return "success";
	}

	@GetMapping("/management/branch/check-dup")
	@ResponseBody
	public String checkDuplicate(@RequestParam("branchId") String branch_id,
			@RequestParam("old_branch_id") String old_branch_id) {
		String return_value = "true";
		if (old_branch_id.equals("") | old_branch_id == null) {
			Branch branch = branchRep.findOne(branch_id.trim());
			if (branch == null)
				return_value = "true";
			else
				return_value = "false";
		} else {
			if (old_branch_id.trim().equals(branch_id.trim())) {
				return_value = "true";
			} else {
				Branch branch = branchRep.findOne(branch_id.trim());
				if (branch == null)
					return_value = "true";
				else
					return_value = "false";
			}
		}
		return return_value;
	}

	// Branch Management Web Module and User

	@GetMapping("/management/branch/manage")
	public Object m_branch(@RequestParam("branch_id") String branch_id,Model model, HttpServletRequest request, HttpSession session) {
		
		Branch branch = branchRep.findOne(branch_id);
		Iterable<UserBranch> userBranchs = userBranchRep.findBranch(branch_id);
		
		current_action = "branch";
		current_title = "Branch";
		model.addAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("form_branch", branch);
		model.addAttribute("userBranchs", userBranchs);
		
		return auth.checkLogin(session, request, "management/branch/m/manage");
	}

}
