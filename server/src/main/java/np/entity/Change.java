package np.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "`change`")
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

	public Date getDate() {
		return date;
	}

	public int getID() {
		return id;
	}

	public Transition getTransition() {
		return transition;
	}

	public User getUser() {
		return user;
	}

}