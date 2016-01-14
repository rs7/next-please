package np.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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

	@Column(columnDefinition = "TINYINT", name = "relation_id")
	public int relationId;

	@Column(name = "user_id")
	public int userId;
}
