package com.cagnosolutions.modules.crm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RootController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root() {
		return "redirect:/secure/home";
	}

	@RequestMapping(value = "/secure/home", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
}
