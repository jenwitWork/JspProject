package com.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.entities.CarModel;

public interface CarModelRepository extends CrudRepository<CarModel, String> {

	@Query(value = "select * from car_model where serie_id = ?1", nativeQuery = true)
	Iterable<CarModel> findSerieId(String serie_id);

	@Query(value = "select * from car_model where serie_id like %?1% and serie_title like %?2% and cm_id like %?3% and cm_name like %?4% order by serie_title,cm_name desc", nativeQuery = true)
	Iterable<CarModel> search(String serie_id,String serieTitle, String cm_id, String cm_name);

}
