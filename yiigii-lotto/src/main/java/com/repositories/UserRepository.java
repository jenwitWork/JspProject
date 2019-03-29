package com.repositories;

import org.springframework.data.repository.CrudRepository;

import com.entities.User;

public interface UserRepository extends CrudRepository<User, String> {

	User findByUsernameAndPassword(String username, String password);

}
