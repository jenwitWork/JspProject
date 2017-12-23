package com.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.CarSery;

public interface CarSerieRepository extends CrudRepository<CarSery, String> {

	CarSery findBySerieTitle(String serie_title);

	@Query(value = "select * from car_series where serie_id like %?1% and serie_title like %?2% order by serie_title", nativeQuery = true)
	Iterable<CarSery> search(String serie_id, String serie_title);

}
