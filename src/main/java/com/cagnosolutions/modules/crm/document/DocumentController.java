package com.cagnosolutions.modules.crm.document;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/document")
public class DocumentController {

	@Autowired
	private DocumentService documentService;

	@RequestMapping(value = "/{docName}/{fk}", method = RequestMethod.GET)
	public String get(@PathVariable String docName, @PathVariable int fk) {
		return "pdf/dqf200";
	}

	@RequestMapping(value = "/{docName}", method = RequestMethod.POST)
	public String test(@PathVariable String docName, Document document, @RequestParam Map<String, String> allRequestParams) {
		System.out.println(docName);
		allRequestParams.remove("fk");
		allRequestParams.remove("_csrf");
		document.setName(docName);
		document.setCompleted(new DateTime());
		document.setData((HashMap<String, String>) allRequestParams);
		documentService.save(document);
		return "redirect:/contact/view/" + document.getFk();
	}
}
