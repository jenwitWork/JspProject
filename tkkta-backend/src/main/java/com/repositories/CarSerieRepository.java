package com.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.CarSery;

public interface CarSerieRepository extends CrudRepository<CarSery, String> {

	/*CarSery findBySerieTitle(String serie_title);

	@Query("select cs from CarSery cs where cs.serieId like %?1% and cs.serieTitle like %?2% order by cs.editDate desc")
	Iterable<CarSery> searchSerie(String serie_id, String serie_title);*/
	
}
