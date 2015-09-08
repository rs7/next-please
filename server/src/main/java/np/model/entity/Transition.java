package np.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "transition")
public class Transition {
	@Id
	@Column(columnDefinition = "TINYINT")
	private int id;
}