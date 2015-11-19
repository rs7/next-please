package np.repository;

import np.entity.Record;

public interface RecordRepository extends EntityRepository<Record, Integer> {

	Iterable<Record> findByRecordBookId(Integer recordBookId);

}
