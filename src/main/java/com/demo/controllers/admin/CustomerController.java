package com.demo.controllers.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import com.demo.entities.Account;
import com.demo.entities.Role;
import com.demo.model.EditProfileModel;
import com.demo.model.RegisterModel;
import com.demo.services.AccountService;
import com.demo.services.RoleService;
import com.demo.services.StorageService;
import com.demo.validators.RegisterValidator;
import com.demo.validators.EditProfileValidator;

@Controller
@RequestMapping("admin/customer")
public class CustomerController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private RegisterValidator accountValidator;

	@Autowired
	private EditProfileValidator editProfileValidator;

	@Autowired
	private RoleService roleService;

	@Autowired
	private StorageService storageService;

	@Autowired
	public CustomerController(StorageService storageService) {
		storageService.init(Paths.get("src/main/resources/static/upload/customer"));
		this.storageService = storageService;
	}

	@GetMapping("")
	public String Index(ModelMap map) {
		List<Account> customers = new ArrayList<Account>();
		for (Account account : accountService.findAll()) {
			for (Role role : account.getRoles()) {
				if (role.getName().equalsIgnoreCase("ROLE_CUSTOMER")) {
					customers.add(account);
				}
			}
		}
		map.put("customers", customers);
		return "../admin/customer/index";
	}

	@GetMapping("profile/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		Account account = accountService.findById(id);
		if (account == null) {
			return "../admin/customer/customer-notfound";
		} else {
			EditProfileModel editProfileModel = new EditProfileModel();
			editProfileModel.setId(account.getId());
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
			modelMap.put("roless", roleService.findAll());
			return "../admin/customer/edit";
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
			return "redirect:/admin/customer/profile/" + customer.getId() + "?success=true";
		} else {
			modelMap.put("roless", roleService.findAll());
			modelMap.put("avatar", MvcUriComponentsBuilder
					.fromMethodName(FileController.class, "serveFile", "defaultAva.jpg").build().toString());
			return "../admin/customer/edit";
		}
	}

	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		accountService.delete(id);
		return "redirect:/admin/customer";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		modelMap.put("avatar", MvcUriComponentsBuilder
				.fromMethodName(FileController.class, "serveFile", "defaultAva.jpg").build().toString());
		modelMap.put("account", new RegisterModel());
		modelMap.put("roless", roleService.findAll());
		return "../admin/customer/add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String register(@ModelAttribute("account") @Valid RegisterModel account, BindingResult bindingResult, ModelMap modelMap) {
		accountValidator.validate(account, bindingResult);
		if (!bindingResult.hasErrors()) {
			Account acc = new Account();
			acc.setUsername(account.getUsername());
			acc.setPassword(account.getPassword());
			acc.setAddress(account.getAddress());
			acc.setEmail(account.getEmail());
			acc.setFullname(account.getFullname());
			acc.setPhone(account.getPhone());
			acc.setBirthday(account.getBirthday());
			acc.setGender(account.getGender());
			acc.setRoles(account.getRoles());
			acc = accountService.save(acc);
			if (!account.getFile().isEmpty()) {
				acc.setAvatar(acc.getId()+"ava.jpg");
				accountService.save(acc);
				editPrcess(acc.getId(), account.getFile());
			}
			return "redirect:/admin/customer";
		} else {
			modelMap.put("roless", roleService.findAll());
			modelMap.put("avatar", MvcUriComponentsBuilder
					.fromMethodName(FileController.class, "serveFile", "defaultAva.jpg").build().toString());
			return "../admin/customer/add";
		}
	}

//	@RequestMapping(value = "upload/{id}", method = RequestMethod.GET)
	public String editView(@PathVariable int id, ModelMap model) {
		Account account = accountService.findById(id);
		model.put("id", id);
		model.put("file", MvcUriComponentsBuilder
				.fromMethodName(FileController.class, "serveFile", account.getAvatar()).build().toString());
		return "../admin/customer/upload";
	}

	@RequestMapping(value = "/remove/avatar/{id}", method = RequestMethod.GET)
	public String removeAvatar(@PathVariable int id, ModelMap model) throws IOException {
		Account account = accountService.findById(id);
		if (!account.getAvatar().equalsIgnoreCase("defaultAva.jpg")) {
			FileUtils.forceDelete(new File("src/main/resources/static/upload/customer/" + account.getAvatar()));
			account.setAvatar("defaultAva.jpg");
			accountService.save(account);
		}
		String avatarPath = MvcUriComponentsBuilder
				.fromMethodName(FileController.class, "serveFile", account.getAvatar()).build().toString();
		model.put("id", id);
		model.put("file", avatarPath);

		return "redirect:/admin/customer/profile/" + id + "?success=true";
	}

//	@RequestMapping(value = "upload/{id}", method = RequestMethod.POST)
	public String editPrcess(@PathVariable int id, @ModelAttribute("file") MultipartFile file) {
		String filename = id + "ava" + ".jpg";
		storageService.store(file, filename);
		Account account = accountService.findById(id);
		account.setAvatar(filename);
		accountService.save(account);
		return "redirect:/admin/customer/upload/" + id;
	}
}