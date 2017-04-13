package com.cagnosolutions.modules.crm.ext.documents.dqf400;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Controller
@RequestMapping("/ext/documents/dqf400")
public class DQF400Controller {

	@RequestMapping(method = RequestMethod.GET)
	public String get() {
		return "ext/documents/dqf400/dqf400";
	}
}