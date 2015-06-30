package com.cagnosolutions.modules.crm.task;

import com.cagnosolutions.modules.crm.contact.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Controller
@RequestMapping("/task")
public class TaskController {
	
	@Autowired
	private TaskService taskService;

	@Autowired
	private ContactService contactService;

	@RequestMapping(method = RequestMethod.GET)
	public String get(Model model) {
		model.addAttribute("tasks", taskService.findAll());
		model.addAttribute("contacts", contactService.findAll());
		return "task/task";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String save(Task task, int contactId, RedirectAttributes attr) {
		if (contactId == 0) {
			attr.addFlashAttribute("alertError", "Invalid contact");
			return "redirect:/task";
		}
		task.setContact(contactService.findOne(contactId));
		taskService.save(task);
		attr.addFlashAttribute("alertSuccess", "Successfully saved task");
		return "redirect:/task/show/cal";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getOne(@PathVariable int id, Model model) {
		model.addAttribute("tasks", taskService.findAll());
		model.addAttribute("task", taskService.findOne(id));
		model.addAttribute("contacts", contactService.findAll());
		return "tasks/tasks";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public String delete(@PathVariable int id, RedirectAttributes attr) {
		taskService.delete(id);
		attr.addFlashAttribute("Successfully deleted task");
		return "redirect:/task";
	}

	@RequestMapping(value = "/show/cal", method = RequestMethod.GET)
	public String cal(Model model) {
		model.addAttribute("tasks", taskService.findAll());
		model.addAttribute("contacts", contactService.findAll());
		return "task/calendar";
	}
}
