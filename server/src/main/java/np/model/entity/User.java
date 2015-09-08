package np.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "user")
public class User {
	@Id
	private int id;

	@Override
    public String toString() {
        return String.format("User[id=%d]", id);
    }
}