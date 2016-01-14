package np.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;

@Entity
@Table(name = "record_book")
@XStreamAlias("record-book")
public class RecordBook {

	@Column(columnDefinition = "TINYINT")
	@Id
	@XStreamAsAttribute
	public int id;

	@Column(name = "title_key")
	public String titleKey;
}
