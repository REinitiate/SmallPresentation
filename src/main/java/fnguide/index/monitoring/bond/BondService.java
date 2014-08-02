package fnguide.index.monitoring.bond;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BondService extends SqlSessionDaoSupport{
	public int GetTest(){
		return (Integer)getSqlSession().selectOne("BondQueryMapper.test");
	}
}
