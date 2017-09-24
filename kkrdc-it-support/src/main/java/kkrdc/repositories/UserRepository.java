package kkrdc.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import kkrdc.entities.User;

public interface UserRepository extends CrudRepository<User, String> {

	@Query(value = "select * from user where username = ?1 and password = ?2", nativeQuery = true)
	User findByUsernameAndPassword(String username, String password);

	@Query(value = "select * from user where username like %?1%", nativeQuery = true)
	Iterable<User> search(String username);

}
