package com.cagnosolutions.modules.crm;

import com.cagnosolutions.modules.crm.user.User;
import com.cagnosolutions.modules.crm.user.UserService;
import com.cagnosolutions.modules.crm.user.UserSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.security.Principal;

@Controller
public class AuthController {

	@Autowired
	UserService userService;

	@Autowired
	UserSession userSession;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/login/success")
	public String loginSucces(Principal principal) {
		if (!"admin".equals(principal.getName())) {
			User user = userService.findOneByUsername(principal.getName());
			userSession.setAdmin(("ROLE_ADMIN".equals(user.getRole())));
		} else {
			userSession.setAdmin(true);
		}
		return "redirect:/";
	}

}
