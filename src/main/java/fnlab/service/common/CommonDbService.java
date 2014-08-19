package fnlab.service.common;


import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDbService extends SqlSessionDaoSupport{
	
	/**
	 * 현재 fnlab_jd 에 적재되어 있는 최종 일자를 반환한다.
	 * @return
	 */
	public String GetlatestTrdDt4StkPrice(Date dt){
		String result = (String) getSqlSession().selectOne("common.selectMaxDtFromJd", dt);
		result = result.replaceAll("-", "");
		return result;
	}
	
	
	
	/**
	 * 기능 : 종목 코드로 종목이름 반환
	 * @param gicode 종목 코드
	 * @return 종목 이름
	 */
	public String GetItemabbrnmByGicode(String gicode){
		String result = (String) getSqlSession().selectOne("common.selectItemabbrnmByGicode", gicode);		
		return result;
	}
	
	
}
