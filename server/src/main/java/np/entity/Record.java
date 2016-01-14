package np.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;

@Entity
@Table(name = "record")
@XStreamAlias("record")
public class Record {

	public Date date;

	@Id
	@XStreamAsAttribute
	public int id;

	@Column(columnDefinition = "TINYINT", name = "record_book_id")
	public int recordBookId;

	@Column(name = "user_id")
	public int userId;

}
