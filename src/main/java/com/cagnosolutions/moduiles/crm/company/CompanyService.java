package com.cagnosolutions.moduiles.crm.company;

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
public class CompanyService {

	@Autowired
	private CompanyRepository repo;

	public List<Company> findAll() {
		return repo.findAll();
	}

	public Company findOne(int id) {
		return repo.findOne(id);
	}

	public Company save(Company company) {
		return repo.save(company);
	}

	public void delete(int id) {
		repo.delete(id);
	}

	public Page<Company> findAll(int page, int size, String dir, String fields) {
		Direction direction = ("desc".equals(dir) ? Direction.DESC : Direction.ASC);
		return repo.findAll(new PageRequest(page, size, direction, fields));
	}

}
