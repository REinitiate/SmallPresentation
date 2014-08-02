package fnlab.service.news;


import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import org.hibernate.type.CalendarType;
import org.json.JSONArray;
import org.json.JSONObject;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fnlab.service.common.CommonDbService;
import fnlab.utility.Ut;

@Repository
public class NewsService extends SqlSessionDaoSupport{
	
	@Autowired
	CommonDbService commonDbService;
	
	public int GetTest(){
		return (Integer)getSqlSession().selectOne("BondQueryMapper.test");
	}
	
	public JSONArray GetNewsJson1(Date dt){
		// text 와 weight로 구성되어 있는 제이슨을 반환하면 되겠군..		
		String maxDt = commonDbService.GetlatestTrdDt4StkPrice(new Date());
		
		Date targetDt = new Date();
		String t1 = Ut.sdf_full.format(targetDt);		
		Calendar cal = new GregorianCalendar();
		cal.setTime(targetDt);	
		cal.add(Calendar.DATE, -1);
		String t0 = Ut.sdf_full.format(cal.getTime());
		
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("t0", t0);
		params.put("t1", t1);
		List<HashMap<String, Object>> news = getSqlSession().selectList("news.selectGetNewByCnt", params);
		
		JSONArray result = new JSONArray();
		
		for(int i=0; i<news.size(); i++){
			JSONObject object = new JSONObject();
			object.put("text", news.get(i).get("itemabbrnm"));
			object.put("weight", news.get(i).get("cnt"));			
			result.put(i, object);
		}
		
		return result;
	}
}
