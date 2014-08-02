package fnlab.service.news;


import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import org.hibernate.type.CalendarType;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONString;
import org.json.JSONStringer;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import scala.util.parsing.json.JSONFormat;
import fnlab.service.common.CommonDbService;
import fnlab.utility.Ut;

@Repository
public class NewsService extends SqlSessionDaoSupport{
	
	@Autowired
	CommonDbService commonDbService;
	
	public int GetTest(){
		return (Integer)getSqlSession().selectOne("BondQueryMapper.test");
	}
	
	public JSONArray GetNewsJson4IndexPage(String t0, String t1, int maxCnt){
		// text 와 weight로 구성되어 있는 제이슨을 반환하면 되겠군..		
		String max_dt = commonDbService.GetlatestTrdDt4StkPrice(new Date());		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("t0", t0);
		params.put("t1", t1);
		params.put("max_dt", max_dt);
				
		List<HashMap<String, Object>> news = getSqlSession().selectList("news.selectGetNewByCnt", params);
		
		if(news.size() <= maxCnt){
			maxCnt = news.size();
		}
		
		JSONArray result = new JSONArray();
			
		
		for(int i=0; i<maxCnt; i++){
			JSONObject object = new JSONObject();
			object.put("text", news.get(i).get("itemabbrnm"));
			Double score = (new Double(maxCnt - i)) / (new Double(maxCnt)) * 100;			
			object.put("weight", score);
			object.put("yield",news.get(i).get("yield"));
			
			JSONObject handler = new JSONObject();
			String strTest = "function(){loadData('$gicode');}";
			strTest = strTest.replace("$gicode", ((String)news.get(i).get("gicode")));			
			JSONFunction jsonFunc = new JSONFunction(strTest);
			handler.put("click", jsonFunc);
			object.put("handlers", handler);
			result.put(i, object);
		}		
		return result;
		
	}
	
	public static class JSONFunction implements JSONString {

	    private String string;

	    public JSONFunction(String string) {
	        this.string = string;
	    }

	    @Override
	    public String toJSONString() {
	        return string;
	    }

	}

	
	public JSONArray GetNewsDetail(String t0, String t1, String gicode){
		
		// text 와 weight로 구성되어 있는 제이슨을 반환하면 되겠군..
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("t0", t0);
		params.put("t1", t1);		
		params.put("gicode", gicode);
				
		List<HashMap<String, Object>> news = getSqlSession().selectList("news.selectNewDetail", params);		
		JSONArray result = new JSONArray();
		
		for(int i=0; i<news.size(); i++){
			JSONObject object = new JSONObject();
			object.put("pub_dt", news.get(i).get("pub_dt"));						
			object.put("title", news.get(i).get("title"));
			object.put("url",news.get(i).get("url"));
			object.put("provider",news.get(i).get("provider"));
			result.put(i, object);
		}		
		return result;
		
	}
}
