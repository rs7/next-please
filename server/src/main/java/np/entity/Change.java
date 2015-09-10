package np.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "`change`")
public class Change {

	private Date date;

	@Id
	private int id;

	@Column(name = "transition_id", columnDefinition = "TINYINT")
	private int transitionID;

	@Column(name = "user_id")
	private int userID;

	public Date getDate() {
		return date;
	}

	public int getID() {
		return id;
	}

	public int getTransitionID() {
		return transitionID;
	}

	public int getUserID() {
		return userID;
	}

}