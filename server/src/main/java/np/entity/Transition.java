package np.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "transition")
@XmlRootElement
public class Transition {

	@JoinColumn(name = "from_relation_id")
	@ManyToOne
	private Relation fromRelation;

	@Id
	@Column(columnDefinition = "TINYINT")
	private int id;

	@JoinColumn(name = "to_relation_id")
	@ManyToOne
	private Relation toRelation;

	@XmlElement
	public Relation getFromRelation() {
		return fromRelation;
	}

	@XmlAttribute
	public int getId() {
		return id;
	}

	@XmlElement
	public Relation getToRelation() {
		return toRelation;
	}

}