package hotel.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import hotel.dao.UsersRepository;
import hotel.models.Users;

@Service
@Transactional
public class UsersService {

	private final UsersRepository usersRep;

	public UsersService(UsersRepository usersRep) {
		super();
		this.usersRep = usersRep;
	}

	public List<Users> findAll() {
		List<Users> users = new ArrayList<>();
		for (Users item : usersRep.findAll()) {
			users.add(item);
		}
		return users;
	}

}
