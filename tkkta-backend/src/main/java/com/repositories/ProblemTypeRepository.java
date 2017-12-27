package com.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.ProblemType;

public interface ProblemTypeRepository extends CrudRepository<ProblemType, String> {

	@Query(value = "select * from problem_type where pb_type like %?1% and pb_name like %?2% order by pb_name", nativeQuery = true)
	List<ProblemType> search(String rb_type, String pb_name);
	
	ProblemType findByPbName(String pb_type);

}
