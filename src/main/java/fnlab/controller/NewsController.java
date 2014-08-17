package fnlab.controller;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fnlab.service.news.NewsService;
import fnlab.utility.Ut;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NewsController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	NewsService newsService;	
	
	@RequestMapping(value = "/news/json", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String Jenny(@RequestParam(required=false) String dt, String gicode) throws ParseException {		
		
		//Date targetDt = Ut.sdf_full.parse("2014-08-01 16:00:00");
		Date targetDt = new Date();
		String t1 = Ut.sdf_full.format(targetDt);		
		Calendar cal = new GregorianCalendar();
		cal.setTime(targetDt);
		
		if(cal.DAY_OF_WEEK == 7)
			cal.add(Calendar.DATE, -3);
		else if(cal.DAY_OF_WEEK == 6)
			cal.add(Calendar.DATE, - 2);
		else
			cal.add(Calendar.DATE, -1);
		
		String t0 = Ut.sdf_full.format(cal.getTime());
		
		JSONArray result = newsService.GetNewsDetail(t0, t1, gicode);
		return result.toString();
	}	
}