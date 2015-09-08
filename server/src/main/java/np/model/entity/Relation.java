package np.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "relation")
public class Relation {
	@Id
	@Column(columnDefinition = "TINYINT")
	private int id;
}