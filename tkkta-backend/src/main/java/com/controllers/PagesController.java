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

import com.entities.Page;
import com.repositories.PageRepository;
import com.repositories.UserPageRepository;

@Controller
public class PagesController extends BaseController {

	@Autowired
	private PageRepository pageRep;

	@Autowired
	private UserPageRepository userPageRep;

	@GetMapping("/management/pages")
	public Object page(Model model, HttpServletRequest request, HttpSession session) {
		current_action = "pages";
		current_title = "Pages";
		model.addAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("search_form", new Page());

		return auth.checkLogin(session, request, "management/pages/index");
	}

	@GetMapping("/management/pages/list")
	public Object list(@ModelAttribute("search_form") Page search, Model model) {

		Iterable<Page> pages = pageRep.search(search.getPageName().trim(), search.getPageDetail().trim());
		model.addAttribute("pages", pages);

		return new ModelAndView("management/pages/_list");
	}

	@GetMapping("/management/pages/create")
	public Object create(Model model, HttpServletRequest request, HttpSession session) {

		model.addAttribute("create_form", new Page());

		return new ModelAndView("management/pages/_create");
	}

	@PostMapping("/management/pages/create")
	@ResponseBody
	public String create(@ModelAttribute("create_form") Page form) {

		form.setCreatedDate(new Date());
		form.setCreatedUser(current_user);
		form.setUpdatedDate(new Date());
		form.setUpdatedUser(current_user);

		pageRep.save(form);

		return "success";
	}

	@GetMapping("/management/pages/edit")
	public Object edit(@RequestParam("pageName") String pageName, Model model, HttpServletRequest request,
			HttpSession session) {

		Page page = pageRep.findOne(pageName.trim());
		model.addAttribute("edit_form", page);

		return new ModelAndView("management/pages/_edit");
	}

	@PostMapping("/management/pages/edit")
	@ResponseBody
	public String edit(@ModelAttribute("edit_form") Page form, @RequestParam("old_page_name") String old_page_name) {

		Page page = pageRep.findOne(old_page_name.trim());

		if (old_page_name.trim().equals(form.getPageName().trim())) {
			page.setPageName(form.getPageName().trim());
			page.setUpdatedDate(new Date());
			page.setUpdatedUser(current_user.trim());

			pageRep.save(page);
		} else {
			if (page != null)
				pageRep.delete(page);

			form.setCreatedDate(new Date());
			form.setCreatedUser(current_user.trim());
			form.setUpdatedDate(new Date());
			form.setUpdatedUser(current_user.trim());

			pageRep.save(form);
			userPageRep.updatePageName(form.getPageName().trim(), old_page_name);
		}

		return "success";
	}

	@GetMapping("/management/pages/delete")
	public Object delete(@RequestParam("pageName") String pageName, Model model, HttpServletRequest request,
			HttpSession session) {

		Page page = pageRep.findOne(pageName.trim());
		model.addAttribute("delete_form", page);

		return new ModelAndView("management/pages/_delete");
	}

	@PostMapping("/management/pages/delete")
	@ResponseBody
	public String delete(@ModelAttribute("delete_form") Page form, HttpServletRequest request, HttpSession session) {

		form = pageRep.findOne(form.getPageName().trim());

		pageRep.delete(form);
		//userPageRep.deletePagename(form.getPageName().trim());
		return "success";

	}

	@GetMapping("/management/pages/check-dup")
	@ResponseBody
	public String checkDuplicate(@RequestParam("pageName") String pageName,
			@RequestParam("old_page_name") String old_page_name) {
		String return_value = "true";
		if (old_page_name.equals("") | old_page_name == null) {
			Page page = pageRep.findOne(pageName.trim());
			if (page == null)
				return_value = "true";
			else
				return_value = "false";
		} else {
			if (old_page_name.trim().equals(pageName.trim())) {
				return_value = "true";
			} else {
				Page page = pageRep.findOne(pageName.trim());
				if (page == null)
					return_value = "true";
				else
					return_value = "false";
			}
		}
		return return_value;
	}

}
