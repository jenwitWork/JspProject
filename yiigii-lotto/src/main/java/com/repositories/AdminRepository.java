package com.repositories;

import org.springframework.data.repository.CrudRepository;

import com.entities.Admin;

public interface AdminRepository extends CrudRepository<Admin, String> {

	
}
