package kkrdc.controllers;

import java.text.ParseException;
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
import kkrdc.entities.Handheld;
import kkrdc.model.HandheldLotusSearch;
import kkrdc.repositories.HandheldReposytory;

@Controller
public class HandheldLotusController extends BaseController {

	@Autowired
	private HandheldReposytory handheldRep;

	@GetMapping("/handheld-lotus")
	public String handheld(Model model, HttpSession session, HttpServletRequest request) {
		current_title = "Handheld-lotus";
		current_url = "handheld";
		model.addAttribute("current_title", current_title);
		model.addAttribute("current_url", current_url);
		model.addAttribute("search_form", new HandheldLotusSearch());

		return auth.checkLogin(session, request, "handheld/lotus");
	}

	@GetMapping("/handheld-lotus/list")
	public String list(@ModelAttribute("search_form") HandheldLotusSearch search, Model model, HttpSession session,
			HttpServletRequest request) {
		gobal_dc_tag = session.getAttribute("gobal_dc_tag").toString();
		Iterable<Handheld> hendhelds = handheldRep.search(search.getAssetNo().trim(), search.getSerialNo().trim(),
				search.getIpAddress().trim(), search.getModel().trim(), search.getStatus().trim(), gobal_dc_tag);
		model.addAttribute("hendhelds", hendhelds);

		return "handheld/_lotus-list";
	}

	@GetMapping("/handheld-lotus/view")
	public String view(@RequestParam("serial_no") String serial_no, Model model, HttpSession session,
			HttpServletRequest request) {
		model.addAttribute("view", handheldRep.findOne(serial_no.trim()));

		return auth.checkLogin(session, request, "handheld/_lotus-view");
	}

	@GetMapping("/handheld-lotus/create")
	public String create(Model model, HttpSession session, HttpServletRequest request) {
		model.addAttribute("create_form", new Handheld());

		return "handheld/_lotus-create";
	}

	@PostMapping("/handheld-lotus/create")
	@ResponseBody
	public String create(@ModelAttribute("create_form") Handheld form, @RequestParam("input_date") String input_date,
			HttpSession session, HttpServletRequest request) throws ParseException {
		
		gobal_dc_tag = session.getAttribute("gobal_dc_tag").toString();
		Date date = formatDate.getDate("dd/MM/yyyy HH:mm:ss", input_date.trim());
		
		form.setDcType(gobal_dc_tag.trim());
		form.setInputDate(date);
		form.setCreatedDate(new Date());
		form.setUpdatedDate(new Date());
		handheldRep.save(form);
		
		return "seccess";
	}

	@GetMapping("/handheld-lotus/edit")
	public String edit(@RequestParam("serial_no") String serial_no, Model model, HttpSession session,
			HttpServletRequest request) {
		model.addAttribute("edit_form", handheldRep.findOne(serial_no.trim()));

		return "handheld/_lotus-edit";
	}

	@PostMapping("/handheld-lotus/edit")
	@ResponseBody
	public String edit(@ModelAttribute("edit_form") Handheld form, @RequestParam("old_sn") String old_sn,
			@RequestParam("input_date") String input_date, HttpSession session, HttpServletRequest request)
			throws ParseException {

		Handheld handheld = handheldRep.findOne(old_sn.trim());
		Date date = formatDate.getDate("dd/MM/yyyy HH:mm:ss", input_date.trim());

		form.setCreatedDate(handheld.getCreatedDate());
		form.setUpdatedDate(new Date());
		form.setInputDate(date);

		handheldRep.delete(old_sn.trim());
		handheldRep.save(form);

		return "success";
	}

	@GetMapping("/handheld-lotus/delete")
	public String delete(@RequestParam("serial_no") String serial_no, Model model, HttpSession session,
			HttpServletRequest request) {
		model.addAttribute("delete_form", handheldRep.findOne(serial_no.trim()));

		return "handheld/_lotus-delete";
	}

	@PostMapping("/handheld-lotus/delete")
	@ResponseBody
	public String delete(@ModelAttribute("delete_form") Handheld form, HttpSession session, HttpServletRequest request) {
		handheldRep.delete(form.getSerialNo().trim());
		return "success";
	}
	
	@GetMapping("/handheld-lotus/check-dup")
	@ResponseBody
	public Object checkDub(@RequestParam(value = "serialNo") String serialNo,
			@RequestParam(value = "old_serialNo") String old_serialNo) {

		if (old_serialNo.trim().equals("") | old_serialNo == null) {
			Handheld cm = handheldRep.findOne(serialNo.trim());
			if (cm != null) {
				return "false";
			} else {
				return "true";
			}
		} else {
			if (old_serialNo.trim().equals(serialNo.trim())) {
				return "true";
			} else {
				Handheld cm = handheldRep.findOne(serialNo.trim());
				if (cm != null) {
					return "false";
				} else {
					return "true";
				}
			}
		}
	}

}
