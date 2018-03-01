package com.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entities.CarModel;
import com.entities.CarSery;
import com.entities.Document;
import com.entities.UserBranch;
import com.entities.UserPage;
import com.google.gson.Gson;
import com.repositories.CarModelRepository;
import com.repositories.CarSerieRepository;
import com.repositories.DocumentRepository;
import com.repositories.UserBranchRepository;
import com.repositories.UserPageRepository;

@Controller
public class Utilities extends BaseController {

	@Autowired
	private CarSerieRepository csRep;
	@Autowired
	private DocumentRepository cpRep;
	@Autowired
	private CarModelRepository cmRep;

	@Autowired
	private UserPageRepository userPageRep;

	@Autowired
	private UserBranchRepository userBranch;

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

	@RequestMapping(value = { "/utilities/series-list" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET }, produces = { "application/json" })
	@ResponseBody
	public String getSeriesList() {
		Iterable<CarSery> seriesList = csRep.findAll();
		Gson gson = new Gson();
		String json = gson.toJson(seriesList);
		return json;
	}

	@RequestMapping(value = { "/utilities/model-list" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET }, produces = { "application/json" })
	@ResponseBody
	public String getModelList(@RequestParam("serie_id") String serie_id) {
		String json = "";
		Iterable<CarModel> modelList = new ArrayList<>();
		if (serie_id.equals("") | serie_id.isEmpty())
			modelList = cmRep.findAll();
		else
			modelList = cmRep.findSerieId(serie_id.trim());
		Gson gson = new Gson();
		json = gson.toJson(modelList);
		return json;
	}

	@RequestMapping(value = { "/utilities/check-dup-doc_no" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET }, produces = { "application/json" })
	@ResponseBody
	public String checkDub(@RequestParam("doc_no") String doc_no) {
		Document cp = (Document) cpRep.findOne(doc_no.trim());
		if (cp != null) {
			return "false";
		}
		return "true";
	}

	@GetMapping("/utilities/user-access")
	@ResponseBody
	public String userAccess(@RequestParam("branch_id") String branch_id, @RequestParam("username") String username,
			@RequestParam("page_name") String page_name, @RequestParam("flag_type") String flag_type) {

		String access = "false";

		UserPage userPage = userPageRep.findUserAccess(branch_id, username, page_name);

		if (flag_type.equals("add")) {
			if (userPage.getFlagAdd().equals("Y"))
				access = "true";
		} else if (flag_type.equals("edit")) {
			if (userPage.getFlagEdit().equals("Y"))
				access = "true";
		} else if (flag_type.equals("delete")) {
			if (userPage.getFlagDelete().equals("Y"))
				access = "true";
		} else if (flag_type.equals("appove")) {
			if (userPage.getFlagApprove().equals("Y"))
				access = "true";
		}

		return access;
	}

	@GetMapping("/utilities/change-branch")
	@ResponseBody
	public String changeBranch(@RequestParam("branch_id") String branch_id, HttpServletRequest request, HttpSession session) {
		String access = "false";

		UserBranch obj = userBranch.find_branch_and_user(branch_id, current_user);
		if (obj != null) {
			current_branch = obj.getBranchId();
			session.setAttribute("current_branch", current_branch);
			access = "true";
		}
		return access;

	}

}
