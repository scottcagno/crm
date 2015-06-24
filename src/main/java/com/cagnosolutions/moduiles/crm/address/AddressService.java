package com.cagnosolutions.moduiles.crm.address;

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
public class AddressService {

	@Autowired
	private AddressRepository repo;

	public List<Address> findAll() {
		return repo.findAll();
	}

	public Address findOne(int id) {
		return repo.findOne(id);
	}

	public Address save(Address address) {
		return repo.save(address);
	}

	public void delete(int id) {
		repo.delete(id);
	}

	public Page<Address> findAll(int page, int size, String dir, String fields) {
		Direction direction = ("desc".equals(dir) ? Direction.DESC : Direction.ASC);
		return repo.findAll(new PageRequest(page, size, direction, fields));
	}
}
