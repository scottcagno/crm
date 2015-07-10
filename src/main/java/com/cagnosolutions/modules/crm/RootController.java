package com.cagnosolutions.modules.crm;

import com.cagnosolutions.modules.crm.user.UserSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RootController {

	@Autowired
	UserSession userSession;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root() {
		return "redirect:/secure/home";
	}

	@RequestMapping(value = "/secure/home", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("admin", userSession.getAdmin());
		return "home";
	}
}
