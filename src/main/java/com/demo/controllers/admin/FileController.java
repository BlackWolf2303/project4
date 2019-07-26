package com.demo.controllers.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.services.StorageService;

@Controller
@RequestMapping("file")
public class FileController {
	
	@Autowired
	private StorageService storageService;
	
	@GetMapping("/image/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String filename) {

        Resource file = storageService.loadAsResource(filename);
        return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,
                "attachment; filename=\"" + file.getFilename() + "\"").body(file);
    }
	
	@GetMapping("/avatar/delete/{filename}")
	public void avatarDelete(@PathVariable("filename") String filename) {	 
	    try {
			FileUtils.forceDelete(new File("src/test/resources/fileToDelete.txt"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String editView(ModelMap model) {
		storageService.init(Paths.get("src/main/resources/static/upload/customer"));
//		model.put("files", storageService.loadAll().map(
//                path -> MvcUriComponentsBuilder.fromMethodName(FileController.class,
//                        "serveFile", path.getFileName().toString()).build().toString())
//                .collect(Collectors.toList()));
		model.put("file", MvcUriComponentsBuilder.fromMethodName(FileController.class,
                "serveFile", "fbAva3.jpg").build().toString());
		return "../admin/customer/upload";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String editPrcess(@ModelAttribute("files") MultipartFile file, RedirectAttributes redirectAttributes) {
		storageService.init(Paths.get("src/main/resources/static/upload/customer"));
		storageService.store(file, file.getOriginalFilename());
		System.out.println(file.getSize());
        return "redirect:/admin/customer/upload";
	}
}
