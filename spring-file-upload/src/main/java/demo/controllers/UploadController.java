package demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {

	@GetMapping("/upload")
	public String upload() {
		return "upload/upload";
	}

	@PostMapping("/upload")
	public String upload(@RequestParam(value = "name") String name, @RequestParam(value = "file") MultipartFile file) {
		return "redirect:home";
	}

	@GetMapping("/multi-upload")
	public String multipleUpload() {
		return "upload/multi-upload";
	}

	@PostMapping("/multi-upload")
	public String multipleUpload(@RequestParam(value = "name") String name,
			@RequestParam(value = "files") MultipartFile files[]) {
		return "redirect:home";
	}

}
