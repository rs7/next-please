package np.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "relation")
@XmlRootElement
public class Relation {

	@Id
	@Column(columnDefinition = "TINYINT")
	private int id;

	@XmlAttribute
	public int getId() {
		return id;
	}

}