package fnlab.service.pattern;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import scala.util.control.Exception;
import fnlab.service.pattern.Pattern.CandleSq.Record;
import fnlab.utility.Ut;

public class Pattern {
	
	SqlSession mSqlSession;
		
	public Pattern(SqlSession session){
		mSqlSession = session;
	}
	
	public ArrayList<CandleSq> Run(CandleSq seq, String dt){
		
		seq.SetOrder();
		seq.SetMaxMin();
		seq.Scale();		
		
		int candleSize = seq.GetCandleSize();
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("dt", dt); // 현재 시점
		params.put("cnt", candleSize); // 캔들 개수
		
		HashMap<String, Date> result =  (HashMap<String, Date>)mSqlSession.selectOne("pattern.selectMaxMinDt", params);
		String t1 = Ut.sdf_yyyyMMdd.format(result.get("max"));
		String t0 = Ut.sdf_yyyyMMdd.format(result.get("min"));
		
		String gicodeTemp = "";
		String gicode = "";
		
		HashMap<String, Object> params2 = new HashMap<>();
		params2.put("t0", t0);
		params2.put("t1", t1);
		
		List<HashMap<String, Object>> data = mSqlSession.selectList("pattern.selectJdAdj", params2); // 주가 데이터 로딩		
		ArrayList<CandleSq> csqList = new ArrayList<>();
		
		for(int i=0; i<data.size(); i++){
			gicode = (String) data.get(i).get("gicode");			
			if(gicodeTemp.compareTo(gicode) != 0){
				// 신규 종목 --> 캔들시퀀스 추가 + 캔들 추가
				CandleSq csq = new CandleSq();
				csq.Gicode = gicode;
				csqList.add(csq);
			}
			
			Integer open = (Integer) data.get(i).get("strt_prc");
			Integer high = (Integer) data.get(i).get("high_prc");
			Integer low = (Integer) data.get(i).get("low_prc");
			Integer cls = (Integer) data.get(i).get("cls_prc");			
			Candle cd = new Candle(open, high, low, cls);			
			csqList.get(csqList.size()-1).Add(cd);
			
			gicodeTemp = gicode;
		}
		
		for(int i=0; i<csqList.size(); i++){
			csqList.get(i).SetMaxMin();
			csqList.get(i).Scale();			
			try {
				csqList.get(i).Score = CalculateSeqDeviation(csqList.get(i), seq);
			} catch (java.lang.Exception e) {
				// TODO Auto-generated catch block
				csqList.get(i).Score = 99999999.0;
				e.printStackTrace();
			}
		}
		
		Collections.sort(csqList, new CandleSqCompare());
		
		return csqList;
	}
	
	/**
	 * 기능 : 두 캔들 시퀀스가 같은 형태인지 체크한다.
	 * @param cs1 캔들 1
	 * @param cs2 캔들 2
	 * @return
	 * 아마 여기서 모든 판가름이 날듯...
	 */
	private boolean CheckSimilarSquence1(CandleSq cs1, CandleSq cs2){
		
		int size = cs1.GetCandleSize();
		boolean result = true;
		
		for(int i=0; i<size; i++){
			 if((cs1.GetCandle(i).Open - cs1.GetCandle(i).Close) * (cs2.GetCandle(i).Open - cs2.GetCandle(i).Close) <= 0){
				 // 두 봉의 색깔이 다르다는 의미임
				 result = false;
			 }
		}
		
		String c1 = cs1.GenerateCode();
		String c2 = cs2.GenerateCode();
		
		if(c1.compareTo(c2) != 0){			
			result = false;
		}
		
		return result;
	}
	
	private Double CalculateSeqDeviation(CandleSq cs1, CandleSq cs2) throws java.lang.Exception{
		
		Double result = 0.0;
		if(cs1.GetCandleSize() != cs2.GetCandleSize()){
			throw new java.lang.Exception("두 캔들 시퀀스의 사이즈가 다릅니다.");
		}
		else{
			if(!CheckSimilarSquence1(cs1, cs2)){
				result = 9999.0;
			}
			int size = cs1.GetCandleSize();
			for(int i=0; i<size; i++){
				result = result + GetDev(cs1.GetCandle(i), cs2.GetCandle(i));
			}
		}
		
		if(result == Double.NaN){
			return result;
		}
		
		return result;
	}
	
	private Double GetDev(Candle c1, Candle c2){
		Double result = 0.0;
		result = result + Math.pow(c1.Open - c2.Open, 2);
		result = result + Math.pow(c1.High - c2.High, 2);
		result = result + Math.pow(c1.Low - c2.Low, 2);
		result = result + Math.pow(c1.Close - c2.Close, 2);
		return result;
	}
	
	public static class Candle{
		public enum CandleType{
			UP,
			DOWN
		}
		
		Double X;
		Double Open;
		Double High;
		Double Low;
		Double Close;
		CandleType type;
		
		public Candle(double open, double high, double low, double close){
			Open = open;
			High = high;
			Low = low;
			Close = close;
			if(close >= open)
				type = CandleType.UP;
			else
				type = CandleType.DOWN;
		}
				
		@Override
		public String toString(){
			DecimalFormat df = new DecimalFormat("0.00");
			StringBuilder sb = new StringBuilder();
			sb.append("[OPEN : " + df.format(Open) + "]\n");
			sb.append("[HIGH : " + df.format(High) + "]\n ");
			sb.append("[LOW : " + df.format(Low) + "]\n");
			sb.append("[CLOSE : " + df.format(Close) + "]\n");
			//sb.append("[X : " + df.format(X) + "]\n");
			return sb.toString();
		}
	
		public ArrayList<Record> GetRecordSeries(int idx){			
			ArrayList<Record> result = new ArrayList<>();			
			Record s = new Record();
			s.code = 1;
			s.index = idx;
			s.value = Open;
			result.add(s);
			Record h = new Record();
			h.code = 2;
			h.index = idx;
			h.value = High;
			result.add(h);
			Record l = new Record();
			l.code = 3;
			l.index = idx;
			l.value = Low;
			result.add(l);
			Record c = new Record();
			c.code = 4;
			c.index = idx;
			c.value = Close;
			result.add(c);
			return result;
		}
	}
	
	public static class CandleSq{
		
		public Boolean IsAvailable = true;
		public String Gicode;
		public Double Score;
		Double Max;
		Double Min;
		ArrayList<Pattern.Candle> candles;		
		
		public CandleSq(){
			candles = new ArrayList<>();
		}
		
		public Candle GetCandle(int idx){
			return candles.get(idx);
		}
		
		public int GetCandleSize(){
			return candles.size();
		}
		
		public void SetMaxMin(double max, double min){
			Max = max;
			Min = min;
		}
		
		public void Add(Candle candle){
			candles.add(candle);
		}
		
		/**
		 * 기능 : 모든 가격의 위치름 -1 ~ 1 사이의 값으로 위치시킨다. 
		 */
		public void Scale(){
		
			Double len = Max - Min;
			
			if(len == 0.0){
				for(int i=0; i<candles.size(); i++)
				{
					candles.get(i).Open = 0.0; 
					candles.get(i).High = 0.0;
					candles.get(i).Low = 0.0;
					candles.get(i).Close = 0.0;
				}
			}
			
			for(int i=0; i<candles.size(); i++)
			{
				candles.get(i).Open = ((candles.get(i).Open - Min) / len) * 2 - 1; 
				candles.get(i).High = ((candles.get(i).High - Min) / len) * 2 - 1;
				candles.get(i).Low = ((candles.get(i).Low - Min) / len) * 2 - 1;
				candles.get(i).Close = ((candles.get(i).Close - Min) / len) * 2 - 1;
			}
		}
		
		@Override
		public String toString(){
			StringBuilder sb = new StringBuilder();
			sb.append("gicode : " + Gicode + "\n");
			sb.append("score : " + Score + "\n");
			sb.append("max : " + Max + "\n");
			sb.append("min : " + Min + "\n");
			for(int i=0; i<candles.size(); i++){
				sb.append("candle" + i + " : " + candles.get(i).toString());
				sb.append("\n ");
			}
			return sb.toString();
		}
	
		public void SetMaxMin(){
			int size = candles.size();
			Double max = candles.get(0).High;
			Double min = candles.get(0).Low;
			
			for(int i=0; i<candles.size(); i++){
				if(candles.get(i).High >= max)
					max = candles.get(i).High;
				if(candles.get(i).Low <= min){
					min = candles.get(i).Low;
				}
			}
			Max = max;
			Min = min;
			return ;
		}
	
		public void SetOrder(){
			Collections.sort(candles, new CandleCompare());
		}
		
		public String GenerateCode(){
			ArrayList<Record> arr = new ArrayList<>();
			for(int i=0; i<GetCandleSize(); i++){
				arr.addAll(candles.get(i).GetRecordSeries(i)); // 모든 캔들 코드를 다 갖다 넣어
			}
			Collections.sort(arr, new RecordCompare());
			StringBuilder sb = new StringBuilder();
			for(int i=0; i<arr.size(); i++){
				sb.append(arr.get(i).index.toString() + arr.get(i).code.toString());
			}
			return sb.toString();
		}
		
		public static class Record{
			Integer index; // 몇 번째 캔들 
			Integer code;  // 시고저종(1,2,3,4)
			Double value;  // 값
		}
		
		static class RecordCompare implements Comparator<Record>{
			public int compare(Record r1, Record r2){
				
				if(r1.value > r2.value){
					return 1;
				} else if(r1.value < r2.value){
					return -1;
				}
				else{
					if(r1.index > r2.index){
						return 1;
					}
					else if(r1.index < r2.index){
						return -1;
					}
					else{
						if(r1.code > r2.code){
							return 1;
						}
						else if(r1.code < r2.code){
							return -1;
						}
						else{
							return 0;
						}
					}
				}
			}
		}
		
		static class CandleCompare implements Comparator<Candle> {
			 
			/**
			 * 오름차순(ASC)
			 */
			@Override
			public int compare(Candle o1, Candle o2) {
				// TODO Auto-generated method stub
				if(o1.X >= o2.X)
					return 1;
				else if(o1.X <= o2.X)				
					return -1;
				else
					return 0;
			}
	 
		}
	}

	static class CandleSqCompare implements Comparator<CandleSq> {
		 
		/**
		 * 오름차순(ASC)
		 */
		@Override
		public int compare(CandleSq o1, CandleSq o2) {
			// TODO Auto-generated method stub
			if(o1.Score >= o2.Score)
				return 1;
			else if(o1.Score <= o2.Score)				
				return -1;
			else
				return 0;
		}
 
	}
}
