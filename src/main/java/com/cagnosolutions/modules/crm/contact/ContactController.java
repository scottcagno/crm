package com.cagnosolutions.modules.crm.contact;

import com.cagnosolutions.modules.crm.address.AddressService;
import com.cagnosolutions.modules.crm.company.CompanyService;
import com.cagnosolutions.modules.crm.document.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Controller
@RequestMapping("/contact")
public class ContactController {

	@Autowired
	private ContactService contactService;

	@Autowired
	private AddressService addressService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private DocumentService documentService;

	@RequestMapping(method = RequestMethod.GET)
	public String get(Model model) {
		model.addAttribute("contacts", contactService.findAll());
		model.addAttribute("companies", companyService.findAll());
		model.addAttribute("addresses", addressService.findAll());
		return "contact/contact";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String save(Contact contact, RedirectAttributes attr, int addressId, int companyId) {
		if (addressId == 0 || companyId == 0) {
			attr.addFlashAttribute("alertError", "Invalid address or contact");
			return (contact.getId() == 0) ? "redirect:/contact" : "redirect:/contact/" + contact.getId();
		}
		contact.setAddress(addressService.findOne(addressId));
		contact.setCompany(companyService.findOne(companyId));
		contactService.save(contact);
		attr.addFlashAttribute("alertSuccess", "Successfully saved contact");
		return "redirect:/contact";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getOne(@PathVariable int id, Model model) {
		model.addAttribute("contacts", contactService.findAll());
		model.addAttribute("companies", companyService.findAll());
		model.addAttribute("addresses", addressService.findAll());
		model.addAttribute("contact", contactService.findOne(id));
		return "contact/contact";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public String delete(@PathVariable int id, RedirectAttributes attr) {
		contactService.delete(id);
		attr.addFlashAttribute("alertSuccess", "Successfully deleted contact");
		return "redirect:/contact";
	}

	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String viewOne(@PathVariable int id, Model model) {
		model.addAttribute("contact", contactService.findOne(id));
		model.addAttribute("documents", documentService.findAllByFk(id));
		return "contact/viewContact";
	}

}
