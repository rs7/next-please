package np.controllers;

import np.entity.Record;
import np.entity.RecordBook;

import np.repository.RecordRepository;
import np.repository.RecordBookRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping(value="/record-book")
@RestController
public class RecordBookController {

	@Autowired
	private RecordRepository records;

	@Autowired
	private RecordBookRepository recordBooks;

	@RequestMapping(method=RequestMethod.GET)
	public Iterable<RecordBook> findAll() {
		return recordBooks.findAll();
	}

	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public RecordBook findById(@PathVariable("id") Integer id) {
		return recordBooks.findById(id).orElseThrow(EntityNotFoundException::new);
	}

	@RequestMapping(value="/{id}/records", method=RequestMethod.GET)
	public Iterable<Record> findByID(@PathVariable("id") Integer id) {
		return records.findByRecordBookId(id);
	}

}
