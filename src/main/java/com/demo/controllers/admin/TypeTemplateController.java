package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.entities.Product;
import com.demo.entities.TypeTemplate;
import com.demo.entities.TypeValue;
import com.demo.services.TypeTemplateService;
import com.demo.services.TypeValueService;

@Controller
@RequestMapping("admin/typetemplate")
public class TypeTemplateController {

	@Autowired
	private TypeTemplateService typeTemplateService;
	@Autowired
	private TypeValueService typeValueService;

	@GetMapping()
	public String index(ModelMap modelMap, HttpServletRequest request) {
		List<TypeTemplate> products = new ArrayList<TypeTemplate>();

		String[] properties = { "name", "caption" };
		String[] directions = { "asc", "desc" };
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		String direction = ServletRequestUtils.getStringParameter(request, "dir", "asc");
		String property = ServletRequestUtils.getStringParameter(request, "prop", "name");

		if (direction.equalsIgnoreCase("asc")) {
			products = (List<TypeTemplate>) typeTemplateService.findAll(Sort.by(Direction.ASC, property));
		} else if (direction.equalsIgnoreCase("desc")) {
			products = (List<TypeTemplate>) typeTemplateService.findAll(Sort.by(Direction.DESC, property));
		}

		PagedListHolder<TypeTemplate> pagedListHolder = new PagedListHolder<TypeTemplate>(products);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(3);
		pagedListHolder.setMaxLinkedPages(3);
		modelMap.put("pagedListHolder", pagedListHolder);
		modelMap.put("properties", properties);
		modelMap.put("directions", directions);
		return "../admin/typetemplate/index";
	}

	@GetMapping("add")
	public String add(ModelMap modelMap) {
		modelMap.put("typeTemplate", new TypeTemplate());
		return "../admin/typetemplate/add";
	}

	@PostMapping("add")
	public String add(@ModelAttribute TypeTemplate typeTemplate, ModelMap modelMap) {
		typeTemplateService.save(typeTemplate);
		return "redirect:/admin/typetemplate";
	}

	@GetMapping("detail/{typetemmplateid}/add")
	public String addDetail(ModelMap modelMap, @PathVariable int typetemmplateid) {
		modelMap.put("typeValue", new TypeValue());
		modelMap.put("typetemmplateid", typetemmplateid);
		return "../admin/typetemplate/addValue";
	}

	@PostMapping("detail/{typetemmplateid}/add")
	public String addDetail(@ModelAttribute TypeValue typeValue, @PathVariable int typetemmplateid, ModelMap modelMap) {
		List<TypeTemplate> typeTemplates = new ArrayList<TypeTemplate>();
		typeTemplates.add(typeTemplateService.find(typetemmplateid));
		typeValue.setTypeTemplates(typeTemplates);
		typeValueService.save(typeValue);
		return "redirect:/admin/typetemplate/detail/" + typetemmplateid;
	}

	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		TypeTemplate typeTemplate = typeTemplateService.find(id);
		if (typeTemplate == null) {
			return "/admin/pagenotfound";
		} else {
			modelMap.put("typeTemplate", typeTemplate);
		}
		return "../admin/typetemplate/edit";
	}

	@GetMapping("detail/{typetemmplateid}/edit/{valueid}")
	public String editDetail(@PathVariable int valueid, @PathVariable int typetemmplateid, ModelMap modelMap) {
		TypeValue typeValue = typeValueService.find(valueid);
		if (typeValue == null) {
			return "/admin/pagenotfound";
		} else {
			modelMap.put("typeValue", typeValue);
			modelMap.put("typetemmplateid", typetemmplateid);
		}
		return "../admin/typetemplate/editValue";
	}

	@PostMapping("edit")
	public String edit(@ModelAttribute("typeTemplate") TypeTemplate typeTemplate) {
		TypeTemplate editTypeTemplate = typeTemplateService.find(typeTemplate.getId());
		if (editTypeTemplate != null) {
			editTypeTemplate.setName(typeTemplate.getName());
			editTypeTemplate.setCaption(typeTemplate.getCaption());
			typeTemplateService.save(editTypeTemplate);
		} else {
			return "/admin/pagenotfound";
		}
		return "redirect:/admin/typetemplate";
	}

	@PostMapping("detail/{typetemplateid}/edit")
	public String editDetail(@ModelAttribute("typeValue") TypeValue typeValue, @PathVariable int typetemplateid) {
		TypeValue editTypeValue = typeValueService.find(typeValue.getId());
		if (editTypeValue != null) {
			editTypeValue.setName(typeValue.getName());
			typeValueService.save(editTypeValue);
			return "redirect:/admin/typetemplate/detail/" + typetemplateid;
		} else {
			return "/admin/pagenotfound";
		}
	}

	@GetMapping("detail/{id}")
	public String detail(@PathVariable("id") int id, ModelMap modelMap, HttpServletRequest request) {

		String[] directions = {"asc","desc"};
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		String direction = ServletRequestUtils.getStringParameter(request, "dir", "asc");
		
		TypeTemplate typeTemplate = typeTemplateService.find(id);
		Comparator<TypeValue> compareByName = (TypeValue o1, TypeValue o2) -> o1.getName().compareTo(o2.getName());
		List<TypeValue> typeValues = typeTemplate.getTypeValues();
		if(direction.equalsIgnoreCase("asc")) {
			Collections.sort(typeValues, compareByName);
		} else if (direction.equalsIgnoreCase("desc")) {
			Collections.sort(typeValues, compareByName.reversed());
		}
//		modelMap.put("typeValues", typeTemplate.getTypeValues());
		PagedListHolder<TypeValue> pagedListHolder = new PagedListHolder<TypeValue>(typeValues);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(5);
		pagedListHolder.setMaxLinkedPages(3); 
		modelMap.put("pagedListHolder", pagedListHolder);
		modelMap.put("directions", directions);
		modelMap.put("typetemmplateid", id);
		return "../admin/typetemplate/detail";
	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable int id, ModelMap modelMap) {
		typeTemplateService.delete(id);
		return "redirect:/admin/typetemplate";
	}

	@GetMapping("detail/{typetemmplateid}/delete/{valueid}")
	public String deleteDetail(@PathVariable int valueid, @PathVariable int typetemmplateid, ModelMap modelMap) {
		TypeValue editTypeValue = typeValueService.find(valueid);
		if (editTypeValue == null) {
			return "/admin/pagenotfound";
		}
		typeValueService.delete(valueid);
		return "redirect:/admin/typetemplate/detail/" + typetemmplateid;
	}
}
