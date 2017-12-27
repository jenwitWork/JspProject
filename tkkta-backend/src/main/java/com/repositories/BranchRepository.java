package com.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.Branch;

public interface BranchRepository extends CrudRepository<Branch, String> {

	@Query(value = "select * from branch where branch_id like %?1% and branch_name like %?2%", nativeQuery = true)
	List<Branch> search(String branch_id, String branch_name);

}
