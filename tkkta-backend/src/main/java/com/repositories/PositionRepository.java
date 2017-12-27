package com.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.UserPo;

public interface PositionRepository extends CrudRepository<UserPo, String> {

	@Query(value = "select * from user_pos where pos_id like %?1% and pos_desc like %?2%", nativeQuery = true)
	List<UserPo> search(String pos_id, String pos_desc);

}
