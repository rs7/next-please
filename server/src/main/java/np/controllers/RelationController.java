package np.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import np.entity.Relation;
import np.repository.RelationRepository;

@RequestMapping(value="/relation")
@RestController
public class RelationController {

	@Autowired
	private RelationRepository relations;

	@RequestMapping(method=RequestMethod.GET)
	private Iterable<Relation> findAll() {
		return relations.findAll();
	}

	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public Relation findByID(@PathVariable("id") Integer id) {
		return relations.findById(id).orElseThrow(EntityNotFoundException::new);
	}

}