package fnlab.service.pattern;

import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fnlab.service.common.CommonDbService;
import fnlab.service.pattern.Pattern.Candle;
import fnlab.service.pattern.Pattern.CandleSq;
import fnlab.utility.Ut;


@Repository
public class PatternService extends SqlSessionDaoSupport{
	
	@Autowired
	CommonDbService commonDbService;
	
	public String GetRankedGicode(JSONArray candleList, String dt){
		
		CandleSq sq = new CandleSq();
		
		for(int i=0; i<candleList.size(); i++){
			Ut.Log(candleList.get(i).toString());
			JSONObject c = (JSONObject) candleList.get(i);
			Double open =  new Double((Long)c.get("open"));
			Double high = new Double((Long) c.get("high"));
			Double low = new Double((Long) c.get("low"));
			Double close = new Double((Long) c.get("close"));
			Candle cd = new Candle(open, high, low, close);
			cd.X = new Double((Long)c.get("x"));
			
			sq.Add(cd);
		}
		
		
		Pattern pat = new Pattern(getSqlSession());
		String result = "";
		
		try {
			result = pat.Run(sq, dt);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
