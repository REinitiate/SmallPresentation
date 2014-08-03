package fnlab.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fnlab.service.news.NewsService;
import fnlab.utility.Ut;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	NewsService newsService;
	
	
	@RequestMapping(value = {"/index", "", "/"}, method = RequestMethod.GET)	
	public String home(@RequestParam(required=false) String dt, HttpServletRequest req, Model model) throws ParseException {
		
		Date targetDt = Ut.sdf_full.parse("2014-08-01 16:00:00");
		//Date targetDt = new Date();
		String t1 = Ut.sdf_full.format(targetDt);		
		Calendar cal = new GregorianCalendar();
		cal.setTime(targetDt);	
		cal.add(Calendar.DATE, -1);
		String t0 = Ut.sdf_full.format(cal.getTime());
		JSONArray json = newsService.GetNewsJson4IndexPage(t0, t1, 500);
		model.addAttribute("cloud", json);
		model.addAttribute("t0", t0);
		model.addAttribute("t1", t1);
		return "index";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)	
	public String Main(@RequestParam(required=false) String dt, HttpServletRequest req, Model model) {
		
		return "template";
		
	}
	
	@RequestMapping(value = "/jenny", method = RequestMethod.GET)	
	public String Jenny(@RequestParam(required=false) String dt, HttpServletRequest req, Model model) {
		
		logger.info("root 경로로 접속했을 시!");
		return "jenny/jenny";
		
	}
	
	@RequestMapping(value = "/jenny/prince", method = RequestMethod.GET)	
	public String JennyPrince(@RequestParam(required=false) String dt, HttpServletRequest req, Model model) {	
		
		logger.info("root 경로로 접속했을 시!");
		return "jenny/prince";
		
	}
}