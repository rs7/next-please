package np.entity;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "reason")
@XStreamAlias("reason")
public class Reason {

	@Column(columnDefinition = "TINYINT")
	@Id
	@XStreamAsAttribute
	public int id;

}
