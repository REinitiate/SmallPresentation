package fnlab.utility;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Ut {
	public static SimpleDateFormat sdf_yyyyMMdd = new SimpleDateFormat("yyyyMMdd");
	public static SimpleDateFormat sdf_yyyyMMdd2 = new SimpleDateFormat("yyyy-MM-dd");
	public static SimpleDateFormat sdf_full = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	
	
	public static String date2str(Date date){
		return sdf_yyyyMMdd.format(date);
	}
	public static Date str2date(String date){
		Date result = null;
		try {
			result = sdf_yyyyMMdd.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public static Date addDate(Date dt, int field, int amount){
		Calendar cal = new GregorianCalendar();
		cal.setTime(dt);
		cal.add(field, amount);
		return cal.getTime();
	}
	
	public static String addDate(String strDt, int field, int amount){		
		Date dt = str2date(strDt);		
		Calendar cal = new GregorianCalendar();
		cal.setTime(dt);
		cal.add(field, amount);
		return date2str(cal.getTime());
	}
	
	
			
	public static void Log(Object msg){		
		System.out.println(sdf_full.format(new Date()) + " : " + msg);
	}
	
	public static Long GetUtc(String dt){		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = new GregorianCalendar();
		try {
			cal.setTime(sdf.parse(dt));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
		}
		return cal.getTimeInMillis() + 1000*60*60*24;
	}
	
	public static Long GetUtc(Date dt){
		Calendar cal = new GregorianCalendar();		
		cal.setTime(dt);		
		return cal.getTimeInMillis() + 1000*60*60*24;
	}
	
	public static String Date2Date(String dt, String conj){
		String result = dt.substring(0, 4) + conj + dt.substring(4, 6) + conj + dt.substring(6, 8);
		
		return result;
	}
	
}
