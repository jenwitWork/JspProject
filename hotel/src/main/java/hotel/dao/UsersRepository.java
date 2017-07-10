package hotel.dao;

import org.springframework.data.repository.CrudRepository;

import hotel.models.Users;

public interface UsersRepository extends CrudRepository<Users, String> {

}
