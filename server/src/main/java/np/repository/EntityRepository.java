package np.repository;

import java.io.Serializable;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface EntityRepository<T, ID extends Serializable> extends CrudRepository<T, ID> {

	Optional<T> findById(ID id);

}
