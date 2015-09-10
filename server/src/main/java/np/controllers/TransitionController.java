package np.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import np.entity.Transition;
import np.repository.TransitionRepository;

@RequestMapping(value="/transition")
@RestController
public class TransitionController {

	@Autowired
	private TransitionRepository transitions;

	@RequestMapping(method=RequestMethod.GET)
	private Iterable<Transition> findAll() {
		return transitions.findAll();
	}

	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public Transition findByID(@PathVariable("id") Integer id) {
		return transitions.findById(id).orElseThrow(() -> new EntityNotFoundException());
	}

}