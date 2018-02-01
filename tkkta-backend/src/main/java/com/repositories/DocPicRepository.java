package com.repositories;

import org.springframework.data.repository.CrudRepository;

import com.entities.DocPic;

public interface DocPicRepository extends CrudRepository<DocPic, String> {

	Iterable<DocPic> findByDocNo(String doc_no);
	
}