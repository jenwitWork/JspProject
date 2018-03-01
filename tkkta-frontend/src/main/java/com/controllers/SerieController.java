package com.controllers;

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

import com.entities.CarModel;
import com.entities.CarSery;
import com.repositories.CarModelRepository;
import com.repositories.CarSerieRepository;
import com.utilities.GenerateCode;

@Controller
public class SerieController extends BaseController {

	@Autowired
	private CarModelRepository cmRep;

	@Autowired
	private CarSerieRepository csRep;

	@GetMapping("/car-serie")
	public Object index(Model model, HttpServletRequest request, HttpSession session) {
		current_action = "car-serie";
		current_title = "รุ่นรถ";

		session.setAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("search_form", new CarSery());

		return auth.checkLogin(session, request, "car-serie/index");
	}

	@GetMapping("/car-serie/list")
	public Object list(@ModelAttribute("search_form") CarSery search, Model model) {

		Iterable<CarSery> car_series = csRep.search("", search.getSerieTitle());
		model.addAttribute("car_series", car_series);

		return new ModelAndView("car-serie/_list");
	}

	@GetMapping("/car-serie/create")
	public Object create(Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("create_form", new CarSery());

		return new ModelAndView("car-serie/_create");
	}

	@PostMapping("/car-serie/create")
	@ResponseBody
	public String create(@ModelAttribute("create_form") CarSery form) {

		CarSery cs = csRep.findBySerieTitle(form.getSerieTitle().trim());

		if (cs == null) {

			form.setSerieId(new GenerateCode().newCode().trim());
			form.setCreatedDate(new Date());
			form.setCreatedUser(current_user);
			form.setUpdatedDate(new Date());
			form.setUpdatedUser(current_user);

			csRep.save(form);
		}

		return "success";
	}

	@GetMapping("/car-serie/edit")
	public Object edit(@RequestParam("serie_id") String serie_id, Model model, HttpServletRequest request,
			HttpSession session) {
		CarSery car_serie = csRep.findOne(serie_id.trim());
		model.addAttribute("edit_form", car_serie);

		return new ModelAndView("car-serie/_edit");
	}

	@PostMapping("/car-serie/edit")
	@ResponseBody
	public String edit(@ModelAttribute("edit_form") CarSery form,
			@RequestParam("old_serie_title") String old_serie_title) {

		CarSery cs = csRep.findOne(form.getSerieId());

		if (!old_serie_title.trim().equals(form.getSerieTitle().trim())) {

			form.setCreatedDate(cs.getCreatedDate());
			form.setCreatedUser(cs.getCreatedUser());
			form.setUpdatedDate(new Date());
			form.setUpdatedUser(current_user);

			csRep.save(form);

			cmRep.updateSerieTitle(form.getSerieTitle(), old_serie_title);

		}

		return "success";
	}

	@GetMapping("/car-serie/delete")
	public Object delete(@RequestParam("serie_id") String serie_id, Model model, HttpServletRequest request,
			HttpSession session) {

		CarSery car_serie = csRep.findOne(serie_id.trim());
		model.addAttribute("delete_form", car_serie);

		return new ModelAndView("car-serie/_delete");
	}

	@PostMapping("/car-serie/delete")
	@ResponseBody
	public String delete(@ModelAttribute("delete_form") CarSery form, HttpServletRequest request, HttpSession session) {
		List<CarModel> models = cmRep.findSerieId(form.getSerieId());
		if (models.size() > 0) {
			return "false";
		} else {
			form = csRep.findOne(form.getSerieId().trim());
			csRep.delete(form);
			return "true";
		}

	}

	@GetMapping("/car-serie/check-dup")
	@ResponseBody
	public String checkDuplicate(@RequestParam("serie_title") String serie_title,
			@RequestParam("old_serie_title") String old_serie_title) {
		String return_value = "true";
		if (old_serie_title.equals("") | old_serie_title == null) {
			CarSery car_serie = csRep.findBySerieTitle(serie_title.trim());
			if (car_serie == null)
				return_value = "true";
			else
				return_value = "false";
		} else {
			if (old_serie_title.trim().equals(serie_title.trim())) {
				return_value = "true";
			} else {
				CarSery car_serie = csRep.findBySerieTitle(serie_title.trim());
				if (car_serie == null)
					return_value = "true";
				else
					return_value = "false";
			}
		}
		return return_value;
	}

}
