package fnlab.service.pattern;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import scala.util.control.Exception;
import fnlab.utility.Ut;

public class Pattern {
	
	public static void main(String args[]){
		
		Candle c1 = new Candle(1, 2, -1, 2);
		Ut.Log(c1.toString());		
		Candle c2 = new Candle(2, 2, -1, 1);
		Ut.Log(c2.toString());
		Candle c3 = new Candle(1, 2, -1, 2);
		Ut.Log(c3.toString());
		Candle c4 = new Candle(5, 8.7, -6, -6);
		Ut.Log(c4.toString());
		
		CandleSq cq1 = new CandleSq();
		cq1.Add(c1);
		cq1.Add(c2);
		cq1.Add(c3);
		cq1.SetMaxMin();
		cq1.Scale();
		
		Pattern pat = new Pattern();
		try {
			pat.Run(cq1, "20140806");
		} catch (java.lang.Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return;
	}
	
	
	public void Run(CandleSq seq, String dt) throws java.lang.Exception{
		
		int candleSize = seq.GetCandleSize();
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("dt", dt);
		params.put("cnt", candleSize);
		
		HashMap<String, Date> result =  (HashMap<String, Date>) db.Open().selectOne("pattern.selectMaxMinDt", params);
		String t1 = Ut.sdf_yyyyMMdd.format(result.get("max"));
		String t0 = Ut.sdf_yyyyMMdd.format(result.get("min"));
		
		String gicodeTemp = "";
		String gicode = "";
		
		HashMap<String, Object> params2 = new HashMap<>();
		params2.put("t0", t0);
		params2.put("t1", t1);
		
		List<HashMap<String, Object>> data = db.Open().selectList("pattern.selectJdAdj", params2);		
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
			csqList.get(i).Score = CalculateSeqDeviation(csqList.get(i), seq);
			Ut.Log(csqList.get(i).Score);
		}
		
		Collections.sort(csqList, new NameAscCompare());
		
		return ;
	}
	
	public void Run(){
		
		Candle c1 = new Candle(2, 3, -2, 0);
		Ut.Log(c1.toString());		
		Candle c2 = new Candle(4.3, 7, -2, 0);
		Ut.Log(c2.toString());
		Candle c3 = new Candle(3.4, 7, -4.3, 1);
		Ut.Log(c3.toString());
		Candle c4 = new Candle(5, 8.7, -6, -6);
		Ut.Log(c4.toString());
		
		CandleSq cq1 = new CandleSq();
		cq1.SetMaxMin(10, -10);
		cq1.Add(c1);
		cq1.Add(c2);
		cq1.Scale();
		
		System.out.print(cq1.toString());
		
		CandleSq cq2 = new CandleSq();
		cq2.SetMaxMin(10, -10);
		cq2.Add(c1);
		cq2.Add(c3);
		cq2.Scale();
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("dt", "20140806");
		params.put("cnt", 3);
		
		HashMap<String, Date> result =  (HashMap<String, Date>) db.Open().selectOne("pattern.selectMaxMinDt", params);
		String t1 = Ut.sdf_yyyyMMdd.format(result.get("max"));
		String t0 = Ut.sdf_yyyyMMdd.format(result.get("min"));
		
		
		System.out.print(cq2.toString());
		
		try {
			Ut.Log(CalculateSeqDeviation(cq1, cq2));
		} catch (java.lang.Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private Double CalculateSeqDeviation(CandleSq cs1, CandleSq cs2) throws java.lang.Exception{
		Double result = 0.0;
		if(cs1.GetCandleSize() != cs2.GetCandleSize()){
			throw new java.lang.Exception("두 캔들 시퀀스의 사이즈가 다릅니다.");
		}
		else{
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
			sb.append("[OPEN : " + df.format(Open) + "] ");
			sb.append("[HIGH : " + df.format(High) + "] ");
			sb.append("[LOW : " + df.format(Low) + "] ");
			sb.append("[CLOSE : " + df.format(Close) + "]");
			
			return sb.toString();
		}
	}
	
	public static class CandleSq{
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
	}

	static class NameAscCompare implements Comparator<CandleSq> {
		 
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
