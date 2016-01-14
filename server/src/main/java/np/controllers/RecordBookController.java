package np.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import np.entity.Record;
import np.entity.RecordBookResource;
import np.repository.RecordBookRepository;
import np.repository.RecordRepository;

@RequestMapping(value = "/record-book")
@RestController
public class RecordBookController {

	@Autowired
	private RecordRepository records;

	@Autowired
	private RecordBookRepository recordBooks;

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public RecordBookResource get(@PathVariable("id") Integer id) {
		return new RecordBookResource(recordBooks.findById(id).orElseThrow(EntityNotFoundException::new));
	}

	@RequestMapping(value = "/{id}/records", method = RequestMethod.GET)
	public Iterable<Record> getRecords(@PathVariable("id") Integer id) {
		return records.findByRecordBookId(id);
	}

}
