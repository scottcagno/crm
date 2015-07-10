package com.cagnosolutions.modules.crm.company;

import com.cagnosolutions.modules.crm.address.AddressService;
import com.cagnosolutions.modules.crm.util.MergeObjects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Controller
@RequestMapping("/secure/company")
public class CompanyController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private MergeObjects mergeObjects;

	@Autowired
	private AddressService addressService;

	@RequestMapping(method = RequestMethod.GET)
	public String get(Model model) {
		model.addAttribute("companies", companyService.findAll());
		model.addAttribute("addresses", addressService.findAll());
		return "company/company";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String save(Company newCompany, RedirectAttributes attr, int addressId, String redirect) {
		if (addressId == 0) {
			attr.addFlashAttribute("alertError", "Invalid address");
			if (redirect != null && !"".equals(redirect)) {
				return "redirect:" + redirect;
			}
			return (newCompany.getId() == 0) ? "redirect:/company" : "redirect:/secure/company/" + newCompany.getId();
		}
		newCompany.setAddress(addressService.findOne(addressId));
		companyService.save(newCompany);
		attr.addFlashAttribute("alertSuccess", "Successfully saved company");
		return (redirect != null && !"".equals(redirect)) ? "redirect:" + redirect : "redirect:/secure/company";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getOne(Model model, @PathVariable int id) {
		Map<String, Object> attrs = new HashMap<>();
		attrs.put("companies", companyService.findAll());
		attrs.put("company", companyService.findOne(id));
		attrs.put("addresses", addressService.findAll());
		model.addAllAttributes(attrs);
		return "company/company";
 	}

	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public String delete(@PathVariable int id, RedirectAttributes attr) {
		companyService.delete(id);
		attr.addFlashAttribute("alertSuccess", "Successfully deleted company");
		return "redirect:/secure/company";
	}

	@RequestMapping(value = "/{id}/contact", method = RequestMethod.GET)
	public String getCompanyContacts(@PathVariable int id, Model model) {
		model.addAttribute("company", companyService.findOne(id));
		return "company/contact";
	}
}
