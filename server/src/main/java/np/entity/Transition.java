package np.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "transition")
public class Transition {

	@Column(name = "from_relation_id", columnDefinition = "TINYINT")
	private int fromRelationID;

	@Id
	@Column(columnDefinition = "TINYINT")
	private int id;

	@Column(name = "to_relation_id", columnDefinition = "TINYINT")
	private int toRelationID;

	public int getFromRelationID() {
		return fromRelationID;
	}

	public int getId() {
		return id;
	}

	public int getToRelationID() {
		return toRelationID;
	}

}