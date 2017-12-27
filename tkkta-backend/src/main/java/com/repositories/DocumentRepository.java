package com.repositories;

import java.util.List;

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

	@Modifying
	@Transactional
	@Query(value = "update document set pb_name = ?1 where pb_name = ?2", nativeQuery = true)
	void updateProblem(String pb_name, String old_pb_name);

	@Query(value = "select * from document where pb_type = ?1", nativeQuery = true)
	List<Document> findPbType(String pb_type);

}
