package np.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import np.entity.Record;
import np.repository.RecordRepository;

@RequestMapping(value="/record")
@RestController
public class RecordController {

	@Autowired
	private RecordRepository records;

	@RequestMapping(method=RequestMethod.GET)
	public Iterable<Record> findAll() {
		return records.findAll();
	}

	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public Record findById(@PathVariable("id") Integer id) {
		return records.findById(id).orElseThrow(EntityNotFoundException::new);
	}

}
