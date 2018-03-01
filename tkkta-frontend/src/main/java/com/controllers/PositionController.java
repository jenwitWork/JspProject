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
import com.entities.UserPo;
import com.repositories.PositionRepository;
import com.repositories.UserRepository;

@Controller
public class PositionController extends BaseController {

	@Autowired
	private PositionRepository posRep;

	@Autowired
	private UserRepository userRep;

	@GetMapping("/management/position")
	public Object pos(Model model, HttpServletRequest request, HttpSession session) {
		current_action = "poss";
		current_title = "UserPos";
		session.setAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("search_form", new UserPo());

		return auth.checkLogin(session, request, "management/position/index");
	}

	@GetMapping("/management/position/list")
	public Object list(@ModelAttribute("search_form") UserPo search, Model model) {

		Iterable<UserPo> positions = posRep.search(search.getPosId().trim(), search.getPosDesc().trim());
		model.addAttribute("positions", positions);

		return new ModelAndView("management/position/_list");
	}

	@GetMapping("/management/position/create")
	public Object create(Model model, HttpServletRequest request, HttpSession session) {

		model.addAttribute("create_form", new UserPo());

		return new ModelAndView("management/position/_create");
	}

	@PostMapping("/management/position/create")
	@ResponseBody
	public String create(@ModelAttribute("create_form") UserPo form) {

		form.setCreatedDate(new Date());
		form.setCreatedUser(current_user);
		form.setUpdatedDate(new Date());
		form.setUpdatedUser(current_user);

		posRep.save(form);

		return "success";
	}

	@GetMapping("/management/position/edit")
	public Object edit(@RequestParam("pos_id") String pos_id, Model model, HttpServletRequest request,
			HttpSession session) {

		UserPo pos = posRep.findOne(pos_id.trim());
		model.addAttribute("edit_form", pos);

		return new ModelAndView("management/position/_edit");
	}

	@PostMapping("/management/position/edit")
	@ResponseBody
	public String edit(@ModelAttribute("edit_form") UserPo form, @RequestParam("old_pos_id") String old_pos_id) {

		UserPo pos = posRep.findOne(old_pos_id.trim());

		if (old_pos_id.trim().equals(form.getPosId().trim())) {
			pos.setPosDesc(form.getPosDesc().trim());
			pos.setUpdatedDate(new Date());
			pos.setUpdatedUser(current_user.trim());

			posRep.save(pos);
		} else {
			if (pos != null)
				posRep.delete(pos);

			form.setCreatedDate(new Date());
			form.setCreatedUser(current_user.trim());
			form.setUpdatedDate(new Date());
			form.setUpdatedUser(current_user.trim());

			posRep.save(form);

			userRep.updatePosition(form.getPosId().trim(), old_pos_id);
		}

		return "success";
	}

	@GetMapping("/management/position/delete")
	public Object delete(@RequestParam("pos_id") String pos_id, Model model, HttpServletRequest request,
			HttpSession session) {

		UserPo pos = posRep.findOne(pos_id.trim());
		model.addAttribute("delete_form", pos);

		return new ModelAndView("management/position/_delete");
	}

	@PostMapping("/management/position/delete")
	@ResponseBody
	public String delete(@ModelAttribute("delete_form") UserPo form, HttpServletRequest request, HttpSession session) {
		form = posRep.findOne(form.getPosId().trim());
		posRep.delete(form);
		return "success";
	}

	@GetMapping("/management/position/check-dup")
	@ResponseBody
	public String checkDuplicate(@RequestParam("posId") String pos_id, @RequestParam("old_pos_id") String old_pos_id) {
		String return_value = "true";
		if (old_pos_id.equals("") | old_pos_id == null) {
			UserPo pos = posRep.findOne(pos_id.trim());
			if (pos == null)
				return_value = "true";
			else
				return_value = "false";
		} else {
			if (old_pos_id.trim().equals(pos_id.trim())) {
				return_value = "true";
			} else {
				UserPo pos = posRep.findOne(pos_id.trim());
				if (pos == null)
					return_value = "true";
				else
					return_value = "false";
			}
		}
		return return_value;
	}

}
