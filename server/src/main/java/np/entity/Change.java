package np.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "`change`")
@XmlRootElement
public class Change {

	private Date date;

	@Id
	private int id;

	@JoinColumn(name = "transition_id")
	@ManyToOne
	private Transition transition;

	@JoinColumn(name = "user_id")
	@ManyToOne
	private User user;

	@XmlElement
	public Date getDate() {
		return date;
	}

	@XmlAttribute
	public int getID() {
		return id;
	}

	@XmlElement
	public Transition getTransition() {
		return transition;
	}

	@XmlElement
	public User getUser() {
		return user;
	}

}