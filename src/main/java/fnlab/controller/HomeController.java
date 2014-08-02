package fnlab.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

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
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)	
	public String home(@RequestParam(required=false) String dt, HttpServletRequest req, Model model) {
		
		/*if(dt == null){
			dt = (String)req.getSession().getAttribute("dt");
			if(dt == null){ // 세션에 없을 시
				String today = (new SimpleDateFormat("yyyyMMdd")).format(new Date());
				model.addAttribute("dt", today);
				req.getSession().setAttribute("dt", today);
			}
			else{
				model.addAttribute("dt", dt);
				req.getSession().setAttribute("dt", dt);
			}
		}
		else{
			model.addAttribute("dt", dt);
			req.getSession().setAttribute("dt", dt);
		}*/
		
		JSONArray json = newsService.GetNewsJson1(new Date());
		model.addAttribute("cloud", json);
		return "index";
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