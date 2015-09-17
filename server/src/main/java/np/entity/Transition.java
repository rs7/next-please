package np.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;

@Entity
@Table(name = "transition")
@XStreamAlias("transition")
public class Transition {

	@JoinColumn(name = "from_relation_id")
	@ManyToOne
	public Relation fromRelation;

	@Id
	@Column(columnDefinition = "TINYINT")
	@XStreamAsAttribute
	public int id;

	@JoinColumn(name = "to_relation_id")
	@ManyToOne
	public Relation toRelation;

}