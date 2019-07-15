package com.demo.controllers.admin;

import java.nio.file.Paths;
import java.util.stream.Collectors;

import javax.validation.Valid;

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

import com.demo.entities.Product;
import com.demo.entities.ProductConfirm;
import com.demo.services.ColorService;
import com.demo.services.ProductService;
import com.demo.services.SizeService;
import com.demo.services.StorageService;

@Controller
@RequestMapping("admin/products")
public class AdminProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private ColorService colorService;
	@Autowired
	private SizeService sizeService;
	 
	private StorageService storageService;
	
	@Autowired
    public AdminProductController(StorageService storageService) {
        this.storageService = storageService;
    }
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("products", productService.findAll());
		return "../admin/products/index";
	}
	
	@RequestMapping(value = "{id}" , method = RequestMethod.GET)
	public String detail(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("product", productService.find(id));
		return "../admin/products/details";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("product") @Valid ProductConfirm product, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			return "../admin/products/add";
		} else {
			Product pro = new Product();
			pro.setName(product.getName());
			pro.setPrice(product.getPrice());
			pro.setQuantity(product.getQuantity());
			productService.save(pro);
			return "redirect:/admin/products";
		}
	}

	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		modelMap.put("product", new ProductConfirm());
		return "../admin/products/add";
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		productService.delete(id);
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("product", productService.find(id));
		modelMap.put("sizes", sizeService.findAll());
		modelMap.put("colors", colorService.findAll());
		return "../admin/products/edit";
	}
	
	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@ModelAttribute("product") Product product) {
		productService.save(product);
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String editView(ModelMap model) {
		storageService.init(Paths.get("UploadedImage"));
		model.put("files", storageService.loadAll().map(
                path -> MvcUriComponentsBuilder.fromMethodName(AdminProductController.class,
                        "serveFile", path.getFileName().toString()).build().toString())
                .collect(Collectors.toList()));
		return "../admin/upload/index";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String editPrcess(@ModelAttribute("files") MultipartFile files, RedirectAttributes redirectAttributes) {
		storageService.init(Paths.get("UploadedImage"));
		storageService.store(files);
        return "redirect:/admin/products/upload";
	}
	
	@GetMapping("/files/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String filename) {

        Resource file = storageService.loadAsResource(filename);
        return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,
                "attachment; filename=\"" + file.getFilename() + "\"").body(file);
    }
}
