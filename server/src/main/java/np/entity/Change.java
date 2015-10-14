package np.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;

@Entity
@Table(name = "`change`")
@XStreamAlias("change")
public class Change {

	public Date date;

	@Id
	@XStreamAsAttribute
	public int id;

	@JoinColumn(name = "to_relation_id")
	@ManyToOne
	public Relation toRelation;

	@JoinColumn(name = "user_id")
	@ManyToOne
	public User user;

}