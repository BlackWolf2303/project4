package com.demo.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.validation.Valid;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import com.demo.controllers.admin.FileController;
import com.demo.entities.Account;
import com.demo.model.EditProfileModel;
import com.demo.services.AccountService;
import com.demo.services.StorageService;
import com.demo.validators.EditProfileValidator;

@Controller
public class ProfileController {
	
	@Autowired
	private AccountService accountService;

	@Autowired
	private EditProfileValidator editProfileValidator;

	@Autowired
	private StorageService storageService;

	@Autowired
	public ProfileController(StorageService storageService) {
		storageService.init(Paths.get("src/main/resources/static/upload/customer"));
		this.storageService = storageService;
	}
	
	@GetMapping("profile")
	public String profile(ModelMap modelMap) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Account account = accountService.findByUsername(authentication.getName());
		if (account == null) {
			return "/login/customer-notfound";
		} else {
			EditProfileModel editProfileModel = new EditProfileModel();
			editProfileModel.setId(account.getId());
			System.out.println(account.getFullname());
			editProfileModel.setFullname(account.getFullname());
			editProfileModel.setBirthday(account.getBirthday());
			editProfileModel.setGender(account.getGender());
			editProfileModel.setEmail(account.getEmail());
			editProfileModel.setPhone(account.getPhone());
			editProfileModel.setAddress(account.getAddress());
			editProfileModel.setAvatar(account.getAvatar());
			editProfileModel.setRoles(account.getRoles());
			modelMap.put("avatar", MvcUriComponentsBuilder
			.fromMethodName(FileController.class, "serveFile", editProfileModel.getAvatar()).build().toString());
			modelMap.put("account", editProfileModel);			
			return "/login/profile";
		}
	}
	
	@PostMapping("profile")
	public String edit(@ModelAttribute("account") @Valid EditProfileModel customer, ModelMap modelMap,
			BindingResult bindingResult) {
		editProfileValidator.validate(customer, bindingResult);
		if (!bindingResult.hasErrors()) {
			Account customerToDB = accountService.findById(customer.getId());
			customerToDB.setFullname(customer.getFullname());
			customerToDB.setGender(customer.getGender());
			customerToDB.setBirthday(customer.getBirthday());
			customerToDB.setEmail(customer.getEmail());
			customerToDB.setPhone(customer.getPhone());
			customerToDB.setAddress(customer.getAddress());
			if (!customer.getFile().isEmpty()) {
				customerToDB.setAvatar(customer.getId()+"ava.jpg");
			}
			customerToDB.setRoles(customer.getRoles());
			customerToDB = accountService.save(customerToDB);
			if (!customer.getFile().isEmpty()) {
				editPrcess(customerToDB.getId(), customer.getFile());
			}
//			modelMap.put("success", true);
			return "redirect:/profile?success=true";
		} else {
			modelMap.put("avatar", MvcUriComponentsBuilder
					.fromMethodName(FileController.class, "serveFile", "defaultAva.jpg").build().toString());
			return "login/profile";
		}
	}

//	@RequestMapping(value = "upload/{id}", method = RequestMethod.POST)
	public void editPrcess(@PathVariable int id, @ModelAttribute("file") MultipartFile file) {
		String filename = id + "ava" + ".jpg";
		storageService.store(file, filename);
		Account account = accountService.findById(id);
		account.setAvatar(filename);
		accountService.save(account);
//		return "redirect:/admin/customer/upload/" + id;
	}
	
	@RequestMapping(value = "/profile/avatar/remove", method = RequestMethod.GET)
	public String removeAvatar(ModelMap model) throws IOException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Account account = accountService.findByUsername(authentication.getName());
		if (!account.getAvatar().equalsIgnoreCase("defaultAva.jpg")) {
			FileUtils.forceDelete(new File("src/main/resources/static/upload/customer/" + account.getAvatar()));
			account.setAvatar("defaultAva.jpg");
			accountService.save(account);
		}
		String avatarPath = MvcUriComponentsBuilder
				.fromMethodName(FileController.class, "serveFile", account.getAvatar()).build().toString();
		model.put("file", avatarPath);

		return "redirect:/profile?success=true";
	}
}
