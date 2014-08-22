package fnlab.service.pattern;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

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
	
	public org.json.JSONObject GetRankedGicode(JSONArray candleList, String dt, int maxCnt){		
		
		CandleSq sq = new CandleSq();
		
		for(int i=0; i<candleList.size(); i++){			
			Ut.Log(candleList.get(i).toString());
			JSONObject c = (JSONObject) candleList.get(i);
			Double open =  new Double((Long)c.get("open"));
			Double high = new Double((Long) c.get("high"));
			Double low = new Double((Long) c.get("low"));
			Double close = new Double((Long) c.get("close"));
			Candle cd = new Candle(open, high, low, close);
			if(c.get("x").getClass().equals(Long.class)){
				cd.X = new Double((Long)c.get("x"));
			}else{
				cd.X = new Double((Double)c.get("x"));
			}	
			
			sq.Add(cd);
		}		
		Pattern pat = new Pattern(getSqlSession());
		ArrayList<CandleSq> ordered = null;
		try {
		 ordered = pat.Run(sq, dt); // 결과 반환
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		org.json.JSONObject result = new org.json.JSONObject();
		// 종목별 가지고 오기.. 근데 이거 주가 리턴도 가지고 와라.
		JSONArray gicodeList = new JSONArray();		
		for(int i=0; i<maxCnt; i++){
			if(ordered.get(i).Score <= 10000){
				
				String gicode = ordered.get(i).Gicode;
				Double score = ordered.get(i).Score;				
				org.json.JSONObject item = new org.json.JSONObject();
				item.put("gicode", gicode);
				item.put("score", score);
				item.put("itemabbrnm", commonDbService.GetItemabbrnmByGicode(gicode));
				
				// 날자 세팅
				Calendar cal = new GregorianCalendar();
				try {
					cal.setTime(Ut.sdf_yyyyMMdd.parse(dt));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				cal.add(Calendar.DATE, -30);
				String t0 = Ut.sdf_yyyyMMdd.format(cal.getTime());
								
				ArrayList<Object[]> timeSeries = GetPriceDataIntoArrayByGicode(gicode, t0, dt);
				item.put("timeseries", timeSeries);				
				
				gicodeList.add(item);			
			}
		}		
		result.put("items", gicodeList);
		return result;
	}
	
	public ArrayList<Object[]> GetPriceDataIntoArrayByGicode(String gicode, String t0, String t1){
		ArrayList<Object[]> result = new ArrayList<>();
		HashMap<String, Object> param = new HashMap<>();
		param.put("gicode", gicode);
		param.put("t0", t0);
		param.put("t1", t1);
		List<HashMap<String, Object>> dataSet = getSqlSession().selectList("pattern.selectPriceData", param);
		
		for(int i=0; i<dataSet.size(); i++){
			Object[] item = new Object[5];
			item[0] = Ut.GetUtc((Date)dataSet.get(i).get("trd_dt"));
			item[1] = dataSet.get(i).get("strt_prc");
			item[2] = dataSet.get(i).get("high_prc");
			item[3] = dataSet.get(i).get("low_prc");
			item[4] = dataSet.get(i).get("cls_prc");			
			result.add(item);
		}
		
		return result;
	}
}
