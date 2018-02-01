package com.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.entities.CarModel;
import com.entities.CarSery;
import com.entities.DocDesc;
import com.entities.DocFile;
import com.entities.DocPic;
import com.entities.DocVdo;
import com.entities.Document;
import com.entities.ProblemType;
import com.repositories.BranchRepository;
import com.repositories.CarModelRepository;
import com.repositories.CarSerieRepository;
import com.repositories.DocDescRepository;
import com.repositories.DocFileRepository;
import com.repositories.DocPicRepository;
import com.repositories.DocVdoRepository;
import com.repositories.DocumentRepository;
import com.repositories.ProblemTypeRepository;
import com.utilities.GenerateCode;

@Controller
public class DocumentController extends BaseController {

	@Autowired
	private DocumentRepository docRep;

	@Autowired
	private DocDescRepository docDescRep;

	@Autowired
	private DocPicRepository cpPicRep;

	@Autowired
	private DocVdoRepository cpVdoRep;

	@Autowired
	private DocFileRepository cppdfRep;

	@Autowired
	private BranchRepository branchRep;

	@Autowired
	private CarSerieRepository csRep;

	@Autowired
	private CarModelRepository cmRep;

	@Autowired
	private ProblemTypeRepository pbRep;
	

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

		Iterable<Document> docs = docRep.search(form.getDocNo(), form.getBranchId(), form.getStatus(),
				form.getSerieTitle(), form.getCmName(), form.getPbName(), form.getCaseNameTh(), form.getCaseNameEn());
		model.addAttribute("docs", docs);

		return new ModelAndView("document/_list");
	}

	@GetMapping("/document/create")
	public Object create(Model model, HttpServletRequest request, HttpSession session) {

		current_action = "document";
		current_title = "สร้างเอกสาร";

		model.addAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("branchList", branchRep.findAll());
		model.addAttribute("csList", csRep.findAll());
		model.addAttribute("pbList", pbRep.findAll());

		model.addAttribute("create_form", new Document());

		return new ModelAndView("document/_create");
	}

	@PostMapping("/document/create")
	@ResponseBody
	public String create(@ModelAttribute("create_form") Document form, @RequestParam("detail") String detail,
			@RequestParam("images") MultipartFile[] images, @RequestParam("pdf") MultipartFile file,
			@RequestParam("videos") MultipartFile videos) {		

		DocDesc cpd = new DocDesc();

		Document doc = docRep.lastRecord();
		
		if (doc == null) {
			form.setDocNo(new GenerateCode().newCodeDocument(""));
		} else {
			form.setDocNo(new GenerateCode().newCodeDocument(doc.getDocNo().trim()));
		}
		
		form.setCreatedDate(new Date());
		form.setCreatedUser(current_user);
		form.setUpdatedDate(new Date());
		form.setUpdatedUser(current_user);
		form.setStatus("pending");
		form.setSerieTitle(csRep.findOne(form.getSerieId().trim()).getSerieTitle().trim());
		form.setCmName(cmRep.findOne(form.getCmId().trim()).getCmName().trim());
		form.setPbName(pbRep.findOne(form.getPbType().trim()).getPbName().trim());
		form.setCreatedDate(new Date());
		form.setUpdatedDate(new Date());

		cpd.setDocNo(form.getDocNo().trim());
		cpd.setCaseDesc(detail.trim());

		docRep.save(form);
		docDescRep.save(cpd);
		uploadImage(images, form.getDocNo().trim(), false);
		uploadFile(file, form.getDocNo().trim(), false);
		uploadVideo(videos, form.getDocNo().trim(), false);

		docRep.save(form);

		return "success";
	}

	@GetMapping("/document/edit")
	public Object edit(@RequestParam("doc_no") String doc_no, Model model, HttpServletRequest request,
			HttpSession session) {

		current_action = "document";
		current_title = "แก้ไขเอกสาร";

		Iterable<CarSery> csList = csRep.findAll();
		Iterable<ProblemType> pbList = pbRep.findAll();

		Document cp = docRep.findOne(doc_no.trim());
		DocDesc cpd = docDescRep.findOne(doc_no.trim());
		Iterable<CarModel> cmList = cmRep.findSerieId(cp.getSerieId().toString());
		Iterable<DocPic> cppList = cpPicRep.findByDocNo(doc_no.trim());
		DocFile pdf = cppdfRep.findByDocNo(doc_no.trim());
		DocVdo vdo = cpVdoRep.findByDocNo(doc_no.trim());

		model.addAttribute("current_action", current_action);
		model.addAttribute("current_title", current_title);
		model.addAttribute("csList", csList);
		model.addAttribute("pbList", pbList);
		model.addAttribute("edit_form", cp);
		model.addAttribute("cpd", cpd);
		model.addAttribute("cmList", cmList);
		model.addAttribute("pdf", pdf);
		model.addAttribute("cppList", cppList);
		model.addAttribute("vdo", vdo);

		return new ModelAndView("document/_edit");
	}

	@PostMapping("/document/edit")
	@ResponseBody
	public String edit(@ModelAttribute("edit_form") Document form, @RequestParam("old_doc_no") String old_doc_no) {

		// Document pos = docRep.findOne(old_doc_no.trim());

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
	public String delete(@ModelAttribute("delete_form") Document form, HttpServletRequest request,
			HttpSession session) {
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

	public void uploadImage(MultipartFile[] images, String doc_no, boolean flag_edit) {
		if (!flag_edit) {
			Iterable<DocPic> imageList = cpPicRep.findByDocNo(doc_no.trim());
			if (imageList != null)
				cpPicRep.delete(imageList);
		}

		if (images.length > 0) {
			for (int i = 0; i < images.length; i++) {
				MultipartFile file = images[i];
				if (!file.isEmpty()) {
					String fileName = "";
					fileName = "_img_" + new GenerateCode().newCode();
					fileName = fileName + ".jpg";
					String fileLocation = "webapps/storage/images";
					try {
						byte[] bytes = file.getBytes();

						String rootPath = System.getProperty("catalina.home");
						File dir = new File(rootPath + File.separator + fileLocation);
						if (!dir.exists())
							dir.mkdirs();
						File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
						BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
						stream.write(bytes);
						stream.close();
						fileLocation = fileLocation + "\\" + fileName;
						fileLocation = "../" + fileLocation.replace("\\", "/");
						fileLocation = fileLocation.replace("webapps", "");
						fileLocation = fileLocation.replace("//", "/");

						DocPic cpPic = new DocPic();
						cpPic.setDocNo(doc_no.trim());
						cpPic.setImagePath(fileLocation.trim());
						cpPicRep.save(cpPic);
					} catch (Exception e) {
					}
				}
			}
		}
	}

	public void uploadVideo(MultipartFile video, String doc_no, boolean flag_edit) {
		if (!flag_edit) {
			DocVdo vdo = cpVdoRep.findByDocNo(doc_no.trim());
			if (vdo != null)
				cpVdoRep.delete(vdo);
		}

		if (!video.isEmpty()) {
			String fileName = "";
			fileName = "_vdo_" + new GenerateCode().newCode();
			fileName = fileName + ".mp4";
			String fileLocation = "webapps/storage/videos";
			try {
				byte[] bytes = video.getBytes();
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + fileLocation);
				if (!dir.exists())
					dir.mkdirs();
				File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				fileLocation = fileLocation + "\\" + fileName;
				fileLocation = "../" + fileLocation.replace("\\", "/");
				fileLocation = fileLocation.replace("webapps", "");
				fileLocation = fileLocation.replace("//", "/");

				DocVdo vdos = new DocVdo();
				vdos.setDocNo(doc_no.trim());
				vdos.setVideoPath(fileLocation.trim());

				cpVdoRep.save(vdos);

			} catch (Exception e) {
			}
		}
	}

	public void uploadFile(MultipartFile file, String doc_no, boolean flag_edit) {
		if (!flag_edit) {
			DocFile pdfTemp = cppdfRep.findByDocNo(doc_no.trim());
			if (pdfTemp != null)
				cppdfRep.delete(pdfTemp);
		}

		if (!file.isEmpty()) {
			String fileName = "";
			fileName = "_file_" + new GenerateCode().newCode();
			fileName = fileName + ".pdf";
			String fileLocation = "webapps/storage/files";
			try {
				byte[] bytes = file.getBytes();

				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + fileLocation);
				if (!dir.exists())
					dir.mkdirs();
				File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				fileLocation = fileLocation + "\\" + fileName;
				fileLocation = "../" + fileLocation.replace("\\", "/");
				fileLocation = fileLocation.replace("webapps", "");
				fileLocation = fileLocation.replace("//", "/");

				DocFile pdf = new DocFile();
				pdf.setDocNo(doc_no.trim());
				pdf.setPdfPath(fileLocation.trim());
				pdf.setPdfName(fileName.trim());
				cppdfRep.save(pdf);
			} catch (Exception e) {
			}
		}
	}

}
