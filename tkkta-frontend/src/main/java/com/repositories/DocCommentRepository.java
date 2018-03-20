package com.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.DocComment;

public interface DocCommentRepository extends CrudRepository<DocComment, Integer> {

	@Query(value = "select * from doc_comment where doc_no = ?1 order by comment_date desc", nativeQuery = true)
	List<DocComment> findByDocNo(String doc_no);
	
	@Modifying
	@Transactional
	@Query(value = "delete from doc_comment where doc_no = ?1", nativeQuery = true)
	void deleteFrom_DocNo(String doc_no);

}
