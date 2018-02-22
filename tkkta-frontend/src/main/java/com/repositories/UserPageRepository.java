package com.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.UserPage;

public interface UserPageRepository extends CrudRepository<UserPage, Integer> {

	@Query(value = "select * from user_page where branch_id = ?1 and username = ?2", nativeQuery = true)
	List<UserPage> find_branch_and_user(String branch_id, String username);

	@Modifying
	@Transactional
	@Query(value = "update user_page set branch_id = ?1 where branch_id = ?2", nativeQuery = true)
	void updateBranch(String branch_id, String old_branch);

	@Modifying
	@Transactional
	@Query(value = "update user_page set branch_id = ?1 where branch_id = ?2 and username = ?3", nativeQuery = true)
	void updateBranchWhereUsername(String branch_id, String old_branch_id, String username);

	@Modifying
	@Transactional
	@Query(value = "update user_page set page_name = ?1 where page_name = ?2", nativeQuery = true)
	void updatePageName(String page_name, String old_page_name);

	@Modifying
	@Transactional
	@Query(value = "delete from user_page where username = ?1", nativeQuery = true)
	void deleteUsername(String username);

	@Modifying
	@Transactional
	@Query(value = "delete from user_page where username = ?1 and branch_id = ?2", nativeQuery = true)
	void deleteUsernameAndBranch(String username, String branch_id);

}
