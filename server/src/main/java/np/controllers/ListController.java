package np.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import np.entity.List;
import np.repository.ListRepository;

@RequestMapping(value="/list")
@RestController
public class ListController {

	@Autowired
	private ListRepository list;

	@RequestMapping(method= RequestMethod.GET)
	public Iterable<List> findAll() {
		return list.findAll();
	}

	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public List findById(@PathVariable("id") Integer id) {
		return list.findById(id).orElseThrow(EntityNotFoundException::new);
	}

}
