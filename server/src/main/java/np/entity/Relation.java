package np.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "relation")
public class Relation {

	@Id
	@Column(columnDefinition = "TINYINT")
	private int id;

	public int getId() {
		return id;
	}

}