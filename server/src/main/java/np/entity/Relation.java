package np.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;

@Entity
@Table(name = "relation")
@XStreamAlias("relation")
public class Relation {

	@Id
	@Column(columnDefinition = "TINYINT")
	@XStreamAsAttribute
	public int id;

}