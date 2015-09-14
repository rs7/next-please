package np.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import np.entity.User;
import np.repository.UserRepository;

@RequestMapping(value="/user")
@RestController
public class UserController {

	@Autowired
	private UserRepository users;

	@RequestMapping(method=RequestMethod.GET)
	private Iterable<User> findAll() {
		return users.findAll();
	}

	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public User findByID(@PathVariable("id") Integer id) {
		return users.findById(id).orElseThrow(EntityNotFoundException::new);
	}

}