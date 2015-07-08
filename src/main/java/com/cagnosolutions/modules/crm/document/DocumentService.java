package com.cagnosolutions.modules.crm.document;

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
public class DocumentService {

	@Autowired
	private DocumentRepository repo;

	public List<Document> findAll() {
		return repo.findAll();
	}

	public List<Document> findAllByFk(int fk) {
		return repo.findAllByFk(fk);
	}

	public Document findOne(int id) {
		return repo.findOne(id);
	}

	public Document save(Document document) {
		return repo.save(document);
	}

	public void delete(int id) {
		repo.delete(id);
	}

	public Page<Document> findAll(int page, int size, String dir, String fields) {
		Direction direction = ("desc".equals(dir) ? Direction.DESC : Direction.ASC);
		return repo.findAll(new PageRequest(page, size, direction, fields));
	}

}
