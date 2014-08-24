package fnlab.controller;

import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = {"/index", "", "/"}, method = RequestMethod.GET)	
	public String home(@RequestParam(required=false) String dt, HttpServletRequest req, Model model) throws ParseException {
		//Date targetDt = Ut.sdf_full.parse("2014-08-01 16:00:00");
		return "index";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)	
	public String Main(@RequestParam(required=false) String dt, HttpServletRequest req, Model model) {
		
		return "template";
	}
	
	@RequestMapping(value = "/resume", method = RequestMethod.GET)	
	public String Resume(@RequestParam(required=false) String contents_path, HttpServletRequest req, Model model) {		
		model.addAttribute("contents_path", contents_path);
		return "resume/template";
		
	}
	
}