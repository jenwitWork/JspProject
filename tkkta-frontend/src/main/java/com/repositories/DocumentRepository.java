package com.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.Document;

public interface DocumentRepository extends CrudRepository<Document, String> {
	
	@Query(value = "select * from document order by doc_no desc limit 1", nativeQuery = true)
	Document lastRecord();

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

	@Query(value = "select * from document where ((doc_no like %?1% and branch_id = ?2 and status like ?3% and serie_title like %?4% and cm_name like %?5% and pb_name like %?6% and case_name_th like %?7% and case_name_en like %?8%) or (doc_no like %?1% and status = ?9 and serie_title like %?4% and cm_name like %?5% and pb_name like %?6% and case_name_th like %?7% and case_name_en like %?8%)) order by doc_no desc", nativeQuery = true)
	List<Document> search(String doc_no, String branch_id, String fst_status, String serie_title, String cm_name,
			String pb_name, String case_name_th, String case_name_en,String scn_status);

}
