package com.repositories;

import org.springframework.data.repository.CrudRepository;

import com.entities.DocVdo;

public interface DocVdoRepository extends CrudRepository<DocVdo, String> {

	DocVdo findByDocNo(String doc_no);
	
}