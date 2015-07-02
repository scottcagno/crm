package com.cagnosolutions.modules.cms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Controller
@RequestMapping("/pdf")
public class PDFController {

	@RequestMapping(method = RequestMethod.POST)
	public String saveDoc(String data) {
		System.out.printf("GOT DATA: %s\n", data);
		return data;
	}

}
