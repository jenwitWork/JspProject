package com.repositories;

import org.springframework.data.repository.CrudRepository;

import com.entities.DocFile;

public interface DocFileRepository extends CrudRepository<DocFile, String> {

	DocFile findByDocNo(String doc_no);
	
}