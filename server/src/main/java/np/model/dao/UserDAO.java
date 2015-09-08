package np.model.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import np.model.entity.User;

public interface UserDAO extends CrudRepository<User, Long> {

}