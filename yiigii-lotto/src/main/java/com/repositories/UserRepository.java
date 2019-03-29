package com.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.User;

public interface UserRepository extends CrudRepository<User, String> {

	User findByUsernameAndPassword(String username, String password);

	@Query(value = "select * from user where username = ?1", nativeQuery = true)
	User findOne(String username);

}
