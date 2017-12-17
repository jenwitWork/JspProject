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

import com.entities.CarModel;
import com.repositories.CarModelRepository;

@Controller
public class ModelController extends BaseController {

	@Autowired
	private CarModelRepository cmRep;
	
	@GetMapping("/car-model")
	public Object index(Model model, HttpServletRequest request, HttpSession session) {
		current_action = "car-model";
		current_title = "แบบรถ";
		model.addAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("search_form", new CarModel());

		return auth.checkLogin(session, request, "car-model/index");
	}

	@GetMapping("/car-model/list")
	public Object list(@ModelAttribute("search_form") CarModel search, Model model) {

		Iterable<CarModel> car_models = cmRep.search(search.getSerieId().trim(),search.getCmId().trim(), search.getCmName().trim());
		model.addAttribute("car_models", car_models);

		return new ModelAndView("car-model/_list");
	}

	@GetMapping("/car-model/create")
	public Object create(Model model, HttpServletRequest request, HttpSession session) {

		model.addAttribute("create_form", new CarModel());

		return new ModelAndView("car-model/_create");
	}

	@PostMapping("/car-model/create")
	@ResponseBody
	public String create(@ModelAttribute("create_form") CarModel form) {

		form.setCreatedDate(new Date());
		form.setCreatedUser(current_user);
		form.setUpdatedDate(new Date());
		form.setUpdatedUser(current_user);

		cmRep.save(form);

		return "success";
	}

	@GetMapping("/car-model/edit")
	public Object edit(@RequestParam("cm_id") String cm_id, Model model, HttpServletRequest request,
			HttpSession session) {

		CarModel car_model = cmRep.findOne(cm_id.trim());
		model.addAttribute("edit_form", car_model);

		return new ModelAndView("car-model/_edit");
	}

	@PostMapping("/car-model/edit")
	@ResponseBody
	public String edit(@ModelAttribute("edit_form") CarModel form, @RequestParam("old_cm_id") String old_cm_id) {

		CarModel car_model = cmRep.findOne(old_cm_id.trim());

		if (old_cm_id.trim().equals(form.getCmId().trim())) {
			car_model.setCmName(form.getCmName().trim());
			car_model.setUpdatedDate(new Date());
			car_model.setUpdatedUser(current_user.trim());

			cmRep.save(car_model);
		} else {
			if (car_model != null)
				cmRep.delete(car_model);

			form.setCreatedDate(new Date());
			form.setCreatedUser(current_user.trim());
			form.setUpdatedDate(new Date());
			form.setUpdatedUser(current_user.trim());

			cmRep.save(form);
		}

		return "success";
	}

	@GetMapping("/car-model/delete")
	public Object delete(@RequestParam("cm_id") String cm_id, Model model, HttpServletRequest request,
			HttpSession session) {

		CarModel car_model = cmRep.findOne(cm_id.trim());
		model.addAttribute("delete_form", car_model);

		return new ModelAndView("car-model/_delete");
	}

	@PostMapping("/car-model/delete")
	@ResponseBody
	public String delete(@ModelAttribute("delete_form") CarModel form, HttpServletRequest request, HttpSession session) {
		form = cmRep.findOne(form.getCmId().trim());
		cmRep.delete(form);
		return "success";
	}

	@GetMapping("/car-model/check-dup")
	@ResponseBody
	public String checkDuplicate(@RequestParam("branchId") String cm_id,
			@RequestParam("old_cm_id") String old_cm_id) {
		String return_value = "true";
		if (old_cm_id.equals("") | old_cm_id == null) {
			CarModel car_model = cmRep.findOne(cm_id.trim());
			if (car_model == null)
				return_value = "true";
			else
				return_value = "false";
		} else {
			if (old_cm_id.trim().equals(cm_id.trim())) {
				return_value = "true";
			} else {
				CarModel car_model = cmRep.findOne(cm_id.trim());
				if (car_model == null)
					return_value = "true";
				else
					return_value = "false";
			}
		}
		return return_value;
	}

}