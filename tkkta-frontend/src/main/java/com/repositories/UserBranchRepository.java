package com.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.UserBranch;

public interface UserBranchRepository extends CrudRepository<UserBranch, Integer> {

	/// Select statement
	@Query(value = "select * from user_branch where username = ?1", nativeQuery = true)
	List<UserBranch> findUsername(String username);

	@Query(value = "select * from user_branch where branch_id = ?1", nativeQuery = true)
	List<UserBranch> findBranch(String branch_id);

	@Query(value = "select * from user_branch where branch_id = ?1 and username = ?2", nativeQuery = true)
	List<UserBranch> find_branch_and_user(String branch_id, String username);

	/// Update statement
	@Modifying
	@Transactional
	@Query(value = "update user_branch set branch_id = ?1 where branch_id = ?2", nativeQuery = true)
	void updateBranch(String branch_id, String old_branch_id);

	@Modifying
	@Transactional
	@Query(value = "update user_branch set branch_id = ?1 where branch_id = ?2 and username = ?3", nativeQuery = true)
	void updateBranchWhereUsername(String branch_id, String old_branch_id, String username);

	/// Delete statement
	@Modifying
	@Transactional
	@Query(value = "delete from user_branch where username = ?1", nativeQuery = true)
	void deleteUsername(String username);
	
	@Modifying
	@Transactional
	@Query(value = "delete from user_branch where username = ?1 and branch_id = ?2", nativeQuery = true)
	void deleteUsernameAndBranch(String username, String branch_id);

	@Modifying
	@Transactional
	@Query(value = "delete from user_branch where branch_id = ?1", nativeQuery = true)
	void deleteBranch(String branch_id);

}
