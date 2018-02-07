package com.repositories;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.DocVdo;

public interface DocVdoRepository extends CrudRepository<DocVdo, String> {

	DocVdo findByDocNo(String doc_no);
	
	/// Delete statement
		@Modifying
		@Transactional
		@Query(value = "delete from doc_vdo where doc_no = ?1", nativeQuery = true)
		void deleteWhereDocNo(String doc_no);
	
}