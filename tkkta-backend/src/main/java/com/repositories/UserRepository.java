package com.repositories;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.User;

public interface UserRepository extends CrudRepository<User, String> {

	User findByUsernameAndPassword(String username, String password);
	
	@Query(value = "select * from user where username like %?1% and name like %?2% and branch_id like %?3% and pos_id like %?4% and group_id like %?5% and status like %?6%",nativeQuery = true)
	Iterable<User> search(String username,String name,String branch_id,String pos_id,String group_id,String status);
	
	@Modifying
	@Transactional
	@Query(value = "update user set branch_id = ?1 where branch_id = ?2", nativeQuery = true)
	void updateBranch(String branch_id,String old_branch);
	
	@Modifying
	@Transactional
	@Query(value = "update user set pos_id = ?1 where pos_id = ?2", nativeQuery = true)
	void updatePosition(String pos_id,String old_pos_id);

}
