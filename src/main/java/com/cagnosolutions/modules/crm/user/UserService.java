package com.cagnosolutions.modules.crm.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

import static org.springframework.data.domain.Sort.Direction;

@Service
public class UserService {

	@Autowired
	private UserRepository repo;

	public List<User> findAll() {
		return repo.findAll();
	}

	public User findOne(int id) {
		return repo.findOne(id);
	}

	public User findOneByUsername(String username) {
		return repo.findOneByUsername(username);
	}

	public User save(User task) {
		return repo.save(task);
	}

	public void delete(int id) {
		repo.delete(id);
	}

	public Page<User> findAll(int page, int size, String dir, String fields) {
		Direction direction = ("desc".equals(dir) ? Direction.DESC : Direction.ASC);
		return repo.findAll(new PageRequest(page, size, direction, fields));
	}

	public boolean canUpdate(int id, String username) {
		return (repo.canUpdate(id, username) == 0);
	}
}
