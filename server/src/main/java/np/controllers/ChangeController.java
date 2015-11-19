package np.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import np.entity.Change;
import np.repository.ChangeRepository;

@RequestMapping(value="/change")
@RestController
public class ChangeController {

	@Autowired
	private ChangeRepository changes;

	@RequestMapping(method=RequestMethod.GET)
	public Iterable<Change> findAll() {
		return changes.findAll();
	}

	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public Change findById(@PathVariable("id") Integer id) {
		return changes.findById(id).orElseThrow(EntityNotFoundException::new);
	}

}
