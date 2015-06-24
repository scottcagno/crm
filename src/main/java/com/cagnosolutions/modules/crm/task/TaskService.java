package com.cagnosolutions.modules.crm.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

import static org.springframework.data.domain.Sort.Direction;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Service
public class TaskService {

	@Autowired
	private TaskRepository repo;

	public List<Task> findAll() {
		return repo.findAll();
	}

	public Task findOne(int id) {
		return repo.findOne(id);
	}

	public Task save(Task task) {
		return repo.save(task);
	}

	public void delete(int id) {
		repo.delete(id);
	}

	public Page<Task> findAll(int page, int size, String dir, String fields) {
		Direction direction = ("desc".equals(dir) ? Direction.DESC : Direction.ASC);
		return repo.findAll(new PageRequest(page, size, direction, fields));
	}
}
