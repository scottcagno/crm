package com.cagnosolutions.modules.crm.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "/rest/task")
public class TaskRestController {

	@Autowired
	private TaskService taskService;

	@RequestMapping(method = RequestMethod.GET)
	public Object get() {
		List<Task> tasks = taskService.findAll();
		List<String> json = new ArrayList<>();
		tasks.forEach( it -> json.add(it.toString()));
		return json;
	}
}
