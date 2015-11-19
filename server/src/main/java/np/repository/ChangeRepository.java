package np.repository;

import np.entity.Change;

public interface ChangeRepository extends EntityRepository<Change, Integer> {

	Iterable<Change> findByUserId(Integer userId);

}
