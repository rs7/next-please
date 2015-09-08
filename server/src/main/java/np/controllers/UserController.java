package np.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import np.model.dao.UserDAO;
import np.model.entity.User;

@RestController
public class UserController {

	@Autowired
	private UserDAO users;

	@RequestMapping("/user")
	private void userGetAll() {
		System.out.println("Users found with findAll():");
		System.out.println("-------------------------------");
		for (User user : users.findAll()) {
			System.out.println(user);
		}
		System.out.println();
	}
}