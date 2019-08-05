package com.demo.controllers.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.entities.Account;
import com.demo.entities.Image;
import com.demo.entities.Product;
import com.demo.entities.TypeTemplate;
import com.demo.model.ProductModel;
import com.demo.services.ColorService;
import com.demo.services.ProductService;
import com.demo.services.SizeService;
import com.demo.services.StorageService;
import com.demo.services.TypeTemplateService;
import com.demo.validators.ProductValidator;

@Controller
@RequestMapping("admin/product")
public class AdminProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private ColorService colorService;
	@Autowired
	private SizeService sizeService;
	@Autowired
	private StorageService storageService;
	@Autowired
	private TypeTemplateService typeTemplateService;
	@Autowired
	private ProductValidator productValidator;

	@Autowired
	public AdminProductController(StorageService storageService) {
		this.storageService = storageService;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("products", productService.findAll());
		return "../admin/product/index";
	}

	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public String detail(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("product", productService.find(id));
		return "../admin/product/details";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		modelMap.put("product", new ProductModel());
		modelMap.put("typeTemplates", typeTemplateService.findAll());
		return "../admin/product/add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("product") @Valid ProductModel product, BindingResult bindingResult, ModelMap modelMap) {
		productValidator.validate(product, bindingResult);
		if (bindingResult.hasErrors()) {
			modelMap.put("typeTemplates", typeTemplateService.findAll());
			return "../admin/product/add";
		} else {
			Product pro = new Product();
			pro.setName(product.getName());
			pro.setPrice(Double.valueOf(product.getPrice()));
			pro.setQuantity(Integer.valueOf(product.getQuantity()));
			pro.setActive(product.isActive());
			pro.setTypeTemplate1(product.getTypeTemplate1());
			pro.setTypeTemplate2(product.getTypeTemplate2());
			pro = productService.save(pro);
			List<Image> images = new ArrayList<Image>();
			for (int j = 0; j < 8; j++) {
				images.add(new Image("picture" + j + pro.getId() + ".jpg", pro));
			}
			pro.setImages(images);
			storageService.store(product.getFile(), "picture", pro.getId());
			productService.save(pro);
			return "redirect:/admin/product";
		}
	}

	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		productService.delete(id);
		return "redirect:/admin/product";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		Product product = productService.find(id);
		ProductModel productModel = new ProductModel();
		productModel.setId(product.getId());
		productModel.setName(product.getName());
		productModel.setPrice(String.valueOf(product.getPrice()));
		productModel.setQuantity(String.valueOf(product.getQuantity()));
		productModel.setTypeTemplate1(product.getTypeTemplate1());
		productModel.setTypeTemplate2(product.getTypeTemplate2());
		productModel.setImages(product.getImages());
		for (int i = 0; i < 8; i++) {
			modelMap.put("picture" + i, MvcUriComponentsBuilder
					.fromMethodName(FileController.class, "serveFile", "picture" + i + id + ".jpg").build().toString());
		}
		modelMap.put("typeTemplates", typeTemplateService.findAll());
		modelMap.put("product", productModel);
		return "../admin/product/edit";
	}

	@RequestMapping(value = "/{productid}/remove/image/{id}", method = RequestMethod.GET)
	public String removeAvatar(@PathVariable int id, @PathVariable int productid, ModelMap model) throws IOException {
//		Product product = productService.find(productid);
		FileUtils.forceDelete(new File("src/main/resources/static/upload/customer/picture" + id + productid + ".jpg"));
//		product.getImages().get(id).setName("");
//		productService.save(product);
		return "redirect:/admin/product/edit/" + productid + "?success=true";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@ModelAttribute("product") @Valid ProductModel product, BindingResult bindingResult, @PathVariable int id, ModelMap modelMap) {
		productValidator.validate(product, bindingResult);
		if (bindingResult.hasErrors()) {
			for (int i = 0; i < 8; i++) {
				modelMap.put("picture" + i, MvcUriComponentsBuilder
						.fromMethodName(FileController.class, "serveFile", "picture" + i + product.getId() + ".jpg").build().toString());
			}
			modelMap.put("typeTemplates", typeTemplateService.findAll());
			return "../admin/product/edit";
		} else {
			Product pro = productService.find(product.getId());
			pro.setName(product.getName());
			pro.setPrice(Double.valueOf(product.getPrice()));
			pro.setQuantity(Integer.valueOf(product.getQuantity()));
			pro.setActive(product.isActive());
			pro.setTypeTemplate1(product.getTypeTemplate1());
			pro.setTypeTemplate2(product.getTypeTemplate2());
			List<Image> images = new ArrayList<Image>();
			if (pro.getImages().size() == 0) {
				for (int j = 0; j < 8; j++) {
					images.add(new Image("picture" + j + pro.getId() + ".jpg", pro));
				}
				pro.setImages(images);
			} 
			storageService.store(product.getFile(), "picture", product.getId());
			productService.save(pro);
			return "redirect:/admin/product/edit/"+product.getId();
		}
	}

}
