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

import com.entities.Document;
import com.entities.ProblemType;
import com.repositories.ProblemTypeRepository;
import com.utilities.GenerateCode;
import com.repositories.DocumentRepository;

@Controller
public class ProblemController extends BaseController {

	@Autowired
	private ProblemTypeRepository pbRep;

	@Autowired
	private DocumentRepository docRep;

	@GetMapping("/problem")
	public Object index(Model model, HttpServletRequest request, HttpSession session) {
		current_action = "problem";
		current_title = "หมวดปัญหา";

		model.addAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("search_form", new ProblemType());

		return auth.checkLogin(session, request, "problem/index");
	}

	@GetMapping("/problem/list")
	public Object list(@ModelAttribute("search_form") ProblemType search, Model model) {

		Iterable<ProblemType> problems = pbRep.search("", search.getPbName());
		model.addAttribute("problems", problems);

		return new ModelAndView("problem/_list");
	}

	@GetMapping("/problem/create")
	public Object create(Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("create_form", new ProblemType());

		return new ModelAndView("problem/_create");
	}

	@PostMapping("/problem/create")
	@ResponseBody
	public String create(@ModelAttribute("create_form") ProblemType form) {

		ProblemType pb = pbRep.findByPbName(form.getPbName());

		if (pb == null) {

			form.setPbType(new GenerateCode().newCode().trim());
			form.setCreatedDate(new Date());
			form.setCreatedUser(current_user);
			form.setUpdatedDate(new Date());
			form.setUpdatedUser(current_user);

			pbRep.save(form);
		}

		return "success";
	}

	@GetMapping("/problem/edit")
	public Object edit(@RequestParam("pb_type") String pb_type, Model model, HttpServletRequest request,
			HttpSession session) {
		ProblemType pb = pbRep.findOne(pb_type.trim());
		model.addAttribute("edit_form", pb);

		return new ModelAndView("problem/_edit");
	}

	@PostMapping("/problem/edit")
	@ResponseBody
	public String edit(@ModelAttribute("edit_form") ProblemType form, @RequestParam("old_pb_name") String old_pb_name) {

		ProblemType pb = pbRep.findOne(form.getPbType());

		if (!old_pb_name.trim().equals(form.getPbName().trim())) {

			form.setCreatedDate(pb.getCreatedDate());
			form.setCreatedUser(pb.getCreatedUser());
			form.setUpdatedDate(new Date());
			form.setUpdatedUser(current_user);

			pbRep.save(form);

			docRep.updateProblem(form.getPbName(), old_pb_name);

		}

		return "success";
	}

	@GetMapping("/problem/delete")
	public Object delete(@RequestParam("pb_type") String pb_type, Model model, HttpServletRequest request,
			HttpSession session) {

		ProblemType pb = pbRep.findOne(pb_type.trim());
		model.addAttribute("delete_form", pb);

		return new ModelAndView("problem/_delete");
	}

	@PostMapping("/problem/delete")
	@ResponseBody
	public String delete(@ModelAttribute("delete_form") ProblemType form, HttpServletRequest request,
			HttpSession session) {

		List<Document> docs = docRep.findPbType(form.getPbType());
		if (docs.size() > 0) {
			return "false";
		} else {
			form = pbRep.findOne(form.getPbType().trim());
			pbRep.delete(form);
			return "true";
		}
	}

	@GetMapping("/problem/check-dup")
	@ResponseBody
	public String checkDuplicate(@RequestParam("pb_name") String pb_name,
			@RequestParam("old_pb_name") String old_pb_name) {
		String return_value = "true";
		if (old_pb_name.equals("") | old_pb_name == null) {
			ProblemType pb = pbRep.findByPbName(pb_name.trim());
			if (pb == null)
				return_value = "true";
			else
				return_value = "false";
		} else {
			if (old_pb_name.trim().equals(pb_name.trim())) {
				return_value = "true";
			} else {
				ProblemType pb = pbRep.findByPbName(pb_name.trim());
				if (pb == null)
					return_value = "true";
				else
					return_value = "false";
			}
		}
		return return_value;
	}

}
