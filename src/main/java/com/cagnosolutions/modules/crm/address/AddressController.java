package com.cagnosolutions.modules.crm.address;

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
@RequestMapping("/address")
public class AddressController {

	@Autowired
	private AddressService addressService;

	@Autowired
	private MergeObjects mergeObjects;

	@RequestMapping(method = RequestMethod.GET)
	public String get(Model model) {
		model.addAttribute("addresses", addressService.findAll());
		return "address/address";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String save(Address newAddress, RedirectAttributes attr, String redirect) {
		Address existingAddress = addressService.findOne(newAddress.getId());
		if (existingAddress != null) {
			newAddress = (Address)mergeObjects.merge(existingAddress, newAddress);
		}
		addressService.save(newAddress);
		attr.addFlashAttribute("alertSuccess", "Successfully saved address");
		return (redirect != null && !"".equals(redirect)) ? "redirect:" + redirect : "redirect:/address";
		//return "redirect:/address";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getOne(Model model, @PathVariable int id) {
		Map<String, Object> attrs = new HashMap<>();
		attrs.put("addresses", addressService.findAll());
		attrs.put("address", addressService.findOne(id));
		model.addAllAttributes(attrs);
		return "address/address";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public String delete(@PathVariable int id, RedirectAttributes attr) {
		addressService.delete(id);
		attr.addFlashAttribute("alertSuccess", "Successfully deleted address");
		return "redirect:/address";
	}


}
