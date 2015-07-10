package com.cagnosolutions.modules.crm;

import com.cagnosolutions.modules.crm.user.User;
import com.cagnosolutions.modules.crm.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
public class AuthController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/login/success")
	public String loginSucces(Principal principal) {
		User user = userService.findOne();
	}

}
