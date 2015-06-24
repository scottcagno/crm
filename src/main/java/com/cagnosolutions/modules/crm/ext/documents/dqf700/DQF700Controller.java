package com.cagnosolutions.modules.crm.ext.documents.dqf700;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Controller
@RequestMapping("/ext/documents/dqf700")
public class DQF700Controller {

	@RequestMapping(method = RequestMethod.GET)
	public String get() {
		return "ext/documents/dqf700/dqf700";
	}
}
