package fnlab.controller;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;

import net.minidev.json.parser.JSONParser;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fnlab.service.common.CommonDbService;
import fnlab.service.news.NewsService;
import fnlab.service.pattern.PatternService;
import fnlab.utility.Ut;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PatternController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	PatternService patternService;
	
	@Autowired
	CommonDbService commonDbService;
	
	@RequestMapping(value = "/pattern/json", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String GetPatternJson(@RequestParam(required=false) String candle_list) throws ParseException, org.json.simple.parser.ParseException {		
		String trd_dt = commonDbService.GetlatestTrdDt4StkPrice(new Date()); // 오늘을 포함한 이전에 가장 최신 jd date를 가지고 온다.
		org.json.simple.parser.JSONParser parser = new org.json.simple.parser.JSONParser();
		JSONArray candleList = (JSONArray) parser.parse(candle_list);		
		JSONObject result = patternService.GetRankedGicode(candleList, trd_dt, 5); 
		return result.toJSONString();
		
	}
}