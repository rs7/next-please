package np.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;

@Entity
@Table(name = "user")
@XStreamAlias("user")
public class User {

	@Id
	@XStreamAsAttribute
	public int id;

}
