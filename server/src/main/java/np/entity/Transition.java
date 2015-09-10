package np.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "transition")
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

	public Relation getFromRelation() {
		return fromRelation;
	}

	public int getId() {
		return id;
	}

	public Relation getToRelation() {
		return toRelation;
	}

}