package com.demo.controllers.admin;

import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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

import com.demo.entities.Image;
import com.demo.entities.Product;
import com.demo.entities.TypeTemplate;
import com.demo.model.ProductModel;
import com.demo.services.ColorService;
import com.demo.services.ProductService;
import com.demo.services.SizeService;
import com.demo.services.StorageService;
import com.demo.services.TypeTemplateService;

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
	public String add(@ModelAttribute("product") @Valid ProductModel product, BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			return "../admin/product/add";
		} else {
			Product pro = new Product();
			pro.setName(product.getName());
			pro.setPrice(Double.valueOf(product.getPrice()));
			pro.setQuantity(Integer.valueOf(product.getQuantity()));
			pro.setActive(product.isActive());
			pro.setTypeTemplate1(product.getTypeTemplate1());
			pro.setTypeTemplate2(product.getTypeTemplate2());
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
//		if (product.getImages().size()>0) {
//			if (product.getImages().get(0) != null) {
//				productModel.setPicture0(product.getImages().get(0).getName());
//			}
//			if (product.getImages().get(7) != null) {
//				productModel.setPicture7(product.getImages().get(7).getName());
//			}
//			if (product.getImages().get(6) != null) {
//				productModel.setPicture6(product.getImages().get(6).getName());
//			}
//			if (product.getImages().get(5) != null) {
//				productModel.setPicture5(product.getImages().get(5).getName());
//			}
//			if (product.getImages().get(4) != null) {
//				productModel.setPicture4(product.getImages().get(4).getName());
//			}
//			if (product.getImages().get(3) != null) {
//				productModel.setPicture3(product.getImages().get(3).getName());
//			}
//			if (product.getImages().get(2) != null) {
//				productModel.setPicture2(product.getImages().get(2).getName());
//			}
//			if (product.getImages().get(1) != null) {
//				productModel.setPicture1(product.getImages().get(1).getName());
//			}

//			modelMap.put("picture0",
//					MvcUriComponentsBuilder
//							.fromMethodName(FileController.class, "serveFile", product.getImages().get(0).getName()).build()
//							.toString());
//			modelMap.put("picture1",
//					MvcUriComponentsBuilder
//							.fromMethodName(FileController.class, "serveFile", product.getImages().get(1).getName()).build()
//							.toString());
//			modelMap.put("picture2",
//					MvcUriComponentsBuilder
//							.fromMethodName(FileController.class, "serveFile", product.getImages().get(2).getName()).build()
//							.toString());
//			modelMap.put("picture3",
//					MvcUriComponentsBuilder
//							.fromMethodName(FileController.class, "serveFile", product.getImages().get(3).getName()).build()
//							.toString());
//			modelMap.put("picture4",
//					MvcUriComponentsBuilder
//							.fromMethodName(FileController.class, "serveFile", product.getImages().get(4).getName()).build()
//							.toString());
//			modelMap.put("picture5",
//					MvcUriComponentsBuilder
//							.fromMethodName(FileController.class, "serveFile", product.getImages().get(5).getName()).build()
//							.toString());
//			modelMap.put("picture6",
//					MvcUriComponentsBuilder
//							.fromMethodName(FileController.class, "serveFile", product.getImages().get(6).getName()).build()
//							.toString());
//			modelMap.put("picture7",
//					MvcUriComponentsBuilder
//							.fromMethodName(FileController.class, "serveFile", product.getImages().get(7).getName()).build()
//							.toString());
//		}
		modelMap.put("product", productModel);
		modelMap.put("typeTemplates", typeTemplateService.findAll());
		return "../admin/product/edit";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("product") ProductModel product) {
		Product pro = productService.find(product.getId());
		System.out.println(pro.getId());
		pro.setName(product.getName());
		pro.setPrice(Double.valueOf(product.getPrice()));
		pro.setQuantity(Integer.valueOf(product.getQuantity()));
		pro.setActive(product.isActive());
		pro.setTypeTemplate1(product.getTypeTemplate1());
		pro.setTypeTemplate2(product.getTypeTemplate2());
		List<Image> images = new ArrayList<Image>();
		if (pro.getImages().size()!=0) {

			for (int i = 0; i < pro.getImages().size(); i++) {
				pro.getImages().get(i).setName(product.getFile()[i].getOriginalFilename());
			}
		} else {
			for (MultipartFile file : product.getFile()) {
				images.add(new Image(file.getOriginalFilename(), pro));
			}
		}
		pro.setImages(images);
		productService.save(pro);
		return "redirect:/admin/product";
	}

	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String editView(ModelMap model) {
		storageService.init(Paths.get("UploadedImage"));
		model.put("files", storageService.loadAll()
				.map(path -> MvcUriComponentsBuilder
						.fromMethodName(AdminProductController.class, "serveFile", path.getFileName().toString())
						.build().toString())
				.collect(Collectors.toList()));
		return "../admin/upload/index";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String editPrcess(@ModelAttribute("files") MultipartFile files, RedirectAttributes redirectAttributes) {
		storageService.init(Paths.get("UploadedImage"));
		storageService.store(files, files.getOriginalFilename());
		return "redirect:/admin/products/upload";
	}

	@GetMapping("/files/{filename:.+}")
	@ResponseBody
	public ResponseEntity<Resource> serveFile(@PathVariable String filename) {

		Resource file = storageService.loadAsResource(filename);
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
				.body(file);
	}
}
