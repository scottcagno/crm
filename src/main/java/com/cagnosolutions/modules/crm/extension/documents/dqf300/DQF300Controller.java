package com.cagnosolutions.modules.crm.extension.documents.dqf300;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Controller
@RequestMapping("/extension/documents/dqf300")
public class DQF300Controller {

	@RequestMapping(method = RequestMethod.GET)
	public String get() {
		return "extension/documents/dqf300/dqf300";
	}
}
