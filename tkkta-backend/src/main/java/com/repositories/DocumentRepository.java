package com.repositories;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.Document;

public interface DocumentRepository extends CrudRepository<Document, String> {

	@Modifying
	@Transactional
	@Query(value = "update document set branch_id = ?1 where branch_id = ?2", nativeQuery = true)
	void updateBranch(String branch_id, String old_branch);

}
