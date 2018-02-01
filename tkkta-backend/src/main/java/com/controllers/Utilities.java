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
import com.google.gson.Gson;
import com.repositories.CarModelRepository;
import com.repositories.CarSerieRepository;
import com.repositories.DocumentRepository;

@Controller
public class Utilities extends BaseController {

	@Autowired
	private CarSerieRepository csRep;
	@Autowired
	private DocumentRepository cpRep;
	@Autowired
	private CarModelRepository cmRep;

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

}
