package com.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.Page;

public interface PageRepository extends CrudRepository<Page, String> {

	@Query(value = "select * from pages where page_name like %?1% and page_detail like %?2%", nativeQuery = true)
	List<Page> search(String page_name, String page_detail);

}
