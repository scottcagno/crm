package com.cagnosolutions.moduiles.crm.contact;

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
public class ContactService {

	@Autowired
	private ContactRepository repo;

	public List<Contact> findAll() {
		return repo.findAll();
	}

	public Contact findOne(int id) {
		return repo.findOne(id);
	}

	public Contact save(Contact contact) {
		return repo.save(contact);
	}

	public void delete(int id) {
		repo.delete(id);
	}

	public Page<Contact> findAll(int page, int size, String dir, String fields) {
		Direction direction = ("desc".equals(dir) ? Direction.DESC : Direction.ASC);
		return repo.findAll(new PageRequest(page, size, direction, fields));
	}
}
