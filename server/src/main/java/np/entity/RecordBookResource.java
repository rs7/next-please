package np.entity;

import np.controllers.RecordBookController;
import org.springframework.hateoas.ResourceSupport;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

public class RecordBookResource extends ResourceSupport {

	public RecordBook recordBook;

	public RecordBookResource(RecordBook recordBook) {
		this.recordBook = recordBook;
		this.add(linkTo(methodOn(RecordBookController.class).get(recordBook.id)).withSelfRel());
		this.add(linkTo(methodOn(RecordBookController.class).getRecords(recordBook.id)).withRel("records"));
	}

}
