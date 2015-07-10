package com.cagnosolutions.modules.crm.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/user")
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping(method = RequestMethod.GET)
	public String get(Model model) {
		model.addAttribute("users", userService.findAll());
		return "user/user";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String save(User user, RedirectAttributes attr) {
		if (userService.canUpdate(user.getId(), user.getUsername())) {
			if ("".equals(user.getPassword()) || user.getPassword() == null) {
				User existingUser = userService.findOne(user.getId());
				user.setPassword(existingUser.getPassword());
			} else {
				user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
			}
			userService.save(user);
			attr.addFlashAttribute("alertSuccess", "Successfully saved user");
			}
		return "redirect:/admin/user";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getOne(@PathVariable int id, Model model) {
		model.addAttribute("users", userService.findAll());
		model.addAttribute("user", userService.findOne(id));
		return "user/user";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public String delete(@PathVariable int id, RedirectAttributes attr) {
		userService.delete(id);
		attr.addFlashAttribute("alertSuccess", "Successfully deleted user");
		return "redirect:/admin/user";
	}
}
