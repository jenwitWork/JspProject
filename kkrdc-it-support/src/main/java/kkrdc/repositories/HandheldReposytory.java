package kkrdc.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import kkrdc.entities.Handheld;

public interface HandheldReposytory extends CrudRepository<Handheld, String> {

	@Query(value = "select * from handheld order by asset_no", nativeQuery = true)
	Iterable<Handheld> findAll();

	@Query(value = "select * from handheld where asset_no like %?1% and serial_no like %?2% and ip_address like %?3% and model like %?4% and status like %?5% and dc_type like %?6% order by asset_type ASC,asset_no ASC", nativeQuery = true)
	Iterable<Handheld> search(String asset_no, String serial_no, String ip_address, String model, String status,String dc_type);

}
