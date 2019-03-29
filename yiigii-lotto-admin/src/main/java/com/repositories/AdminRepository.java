package com.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.Admin;

public interface AdminRepository extends CrudRepository<Admin, String> {

	@Query(value = "select * from admim where username = ?1 and password = ?2 and status = ?3", nativeQuery = true)
	Admin login(String username, String passwordm, String status);
	Admin findByUsernameAndPassword(String username,String password);

}
