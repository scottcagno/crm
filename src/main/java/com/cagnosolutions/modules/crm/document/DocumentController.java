package com.cagnosolutions.modules.crm.document;

import com.cagnosolutions.modules.crm.contact.ContactService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/secure/document")
public class DocumentController {

	@Autowired
	private DocumentService documentService;

	@Autowired
	ContactService contactService;

	@RequestMapping(value = "/{docName}/{fk}", method = RequestMethod.GET)
	public String get(@PathVariable String docName, @PathVariable int fk, Model model) {
		model.addAttribute("contact", contactService.findOne(fk));
		return "pdf/" + docName;
	}

	@RequestMapping(value = "/{docName}/{fk}", method = RequestMethod.POST)
	public String save(@PathVariable String docName, Document document, @RequestParam Map<String, String> allRequestParams) {
		allRequestParams.remove("fk");
		allRequestParams.remove("_csrf");
		document.setName(docName);
		document.setCompleted(new DateTime());
		document.getCompleted();
		document.setData((HashMap<String, String>) allRequestParams);
		documentService.save(document);
		return "redirect:/secure/contact/view/" + document.getFk();
	}

	/*@RequestMapping(value = "/{docName}/{fk}", method = RequestMethod.POST)
	@ResponseBody
	public Object test(@PathVariable String docName, Document document, @RequestParam Map<String, String> allRequestParams) {
		allRequestParams.remove("fk");
		allRequestParams.remove("_csrf");
		document.setName(docName);
		document.setCompleted(new DateTime());
		document.setData((HashMap<String, String>) allRequestParams);
		return document;
	}*/

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getOne(@PathVariable int id, Model model) {
		Document document = documentService.findOne(id);
		model.addAttribute("document", document);
		model.addAttribute("script", "<script src=\"/static/js/document.js\"></script>");
		model.addAttribute("contact", contactService.findOne(document.getFk()));
		return "pdf/" + document.getName();
	}
}
