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

import com.entities.Document;
import com.repositories.DocumentRepository;

@Controller
public class DocumentController extends BaseController {
	
	@Autowired
	private DocumentRepository docRep;

	@GetMapping("/document")
	public Object pos(Model model, HttpServletRequest request, HttpSession session) {
		current_action = "document";
		current_title = "จัดการเอกสาร";
		model.addAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("search_form", new Document());

		return auth.checkLogin(session, request, "document/index");
	}

	@GetMapping("/document/list")
	public Object list(@ModelAttribute("search_form") Document form, Model model) {

		Iterable<Document> docs = docRep.search(form.getDocNo(), form.getBranchId(), form.getStatus(), form.getSerieTitle(), form.getCmName(), form.getPbName(), form.getCaseNameTh(), form.getCaseNameEn());
		model.addAttribute("docs", docs);

		return new ModelAndView("document/_list");
	}

	@GetMapping("/document/create")
	public Object create(Model model, HttpServletRequest request, HttpSession session) {

		current_action = "document";
		current_title = "สร้างเอกสาร";
		model.addAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		
		model.addAttribute("create_form", new Document());

		return new ModelAndView("document/_create");
	}

	@PostMapping("/document/create")
	@ResponseBody
	public String create(@ModelAttribute("create_form") Document form) {

		form.setCreatedDate(new Date());
		form.setCreatedUser(current_user);
		form.setUpdatedDate(new Date());
		form.setUpdatedUser(current_user);

		docRep.save(form);

		return "success";
	}

	@GetMapping("/document/edit")
	public Object edit(@RequestParam("doc_no") String doc_no, Model model, HttpServletRequest request,
			HttpSession session) {

		Document pos = docRep.findOne(doc_no.trim());
		model.addAttribute("edit_form", pos);

		return new ModelAndView("document/_edit");
	}

	@PostMapping("/document/edit")
	@ResponseBody
	public String edit(@ModelAttribute("edit_form") Document form, @RequestParam("old_doc_no") String old_doc_no) {

		//Document pos = docRep.findOne(old_doc_no.trim());


		return "success";
	}

	@GetMapping("/document/delete")
	public Object delete(@RequestParam("doc_no") String doc_no, Model model, HttpServletRequest request,
			HttpSession session) {

		Document pos = docRep.findOne(doc_no.trim());
		model.addAttribute("delete_form", pos);

		return new ModelAndView("document/_delete");
	}

	@PostMapping("/document/delete")
	@ResponseBody
	public String delete(@ModelAttribute("delete_form") Document form, HttpServletRequest request, HttpSession session) {
		form = docRep.findOne(form.getDocNo().trim());
		docRep.delete(form);
		return "success";
	}

	@GetMapping("/document/check-dup")
	@ResponseBody
	public String checkDuplicate(@RequestParam("doc_no") String doc_no, @RequestParam("old_doc_no") String old_doc_no) {
		String return_value = "true";
		if (old_doc_no.equals("") | old_doc_no == null) {
			Document pos = docRep.findOne(doc_no.trim());
			if (pos == null)
				return_value = "true";
			else
				return_value = "false";
		} else {
			if (old_doc_no.trim().equals(doc_no.trim())) {
				return_value = "true";
			} else {
				Document pos = docRep.findOne(doc_no.trim());
				if (pos == null)
					return_value = "true";
				else
					return_value = "false";
			}
		}
		return return_value;
	}

}
