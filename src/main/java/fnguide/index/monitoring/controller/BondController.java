package fnguide.index.monitoring.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.jdbc.Util;

import fnguide.index.monitoring.utility.Ut;

@Controller
public class BondController {
	private static final Logger logger = LoggerFactory.getLogger(BondController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "bond/ktb", method=RequestMethod.POST)	
	public String Cash(@RequestParam(required=false) String dt, HttpServletRequest req, Model model) {
		
		logger.info("root 경로로 접속했을 시!");
		
		if(dt == null){
			dt = (String)req.getSession().getAttribute("dt");
			if(dt == null){ // 세션에 없을 시
				String today = (new SimpleDateFormat("yyyyMMdd")).format(new Date());
				dt = today;
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
		}
		
		HashMap<String, String> input = new HashMap<String, String>();		
		input.put("trd_dt", dt);
		input.put("idx_cd", "FBI.KTB.01");
		
		List<HashMap<String, Object>> outItemHist = sqlSession.selectList("BondQueryMapper.selectBndItemHist" , input);
		
		// dt 부다 일주일 내에 있으면 체크 컬럼명 '경고'
		Calendar cal = new GregorianCalendar();
		cal.setTime(Ut.str2date(dt));
		cal.add(Calendar.DATE, 7);
		Date t1_upper = cal.getTime();
		
		for(int i=0; i<outItemHist.size(); i++){
			
			if(((String)outItemHist.get(i).get("최근이자지급일")).compareTo("할인채") != 0){
				Date exp_dt = Ut.str2date((String)outItemHist.get(i).get("만기일"));
				Date int_dt = Ut.str2date((String)outItemHist.get(i).get("최근이자지급일"));
				
				if(exp_dt.before(t1_upper) || int_dt.before(t1_upper)) {
					outItemHist.get(i).put("경고", "경고");
				}
				else{
					outItemHist.get(i).put("경고", "없음");
				}
			}
			else{
				outItemHist.get(i).put("경고", "없음");
			}
		}
				
		model.addAttribute("type", "url");
		model.addAttribute("contents", "contents_bond/ktb.jsp");
		model.addAttribute("service", "/bond/ktb");
		model.addAttribute("outItemHist", outItemHist);
		
		
		return "template";
	}
	
	@RequestMapping(value = "bond/cash", method=RequestMethod.POST)	
	public String Ktb(@RequestParam(required=false) String dt, HttpServletRequest req, Model model) {
		
		logger.info("root 경로로 접속했을 시!"); 
		
		if(dt == null){
			dt = (String)req.getSession().getAttribute("dt");
			if(dt == null){ // 세션에 없을 시
				String today = (new SimpleDateFormat("yyyyMMdd")).format(new Date());
				dt = today;
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
		}
		
		HashMap<String, String> input = new HashMap<String, String>();		
		input.put("trd_dt", dt);
		input.put("idx_cd", "FBI.KTB.01");
		
		List<HashMap<String, Object>> outItemHist = sqlSession.selectList("BondQueryMapper.selectBndItemHist" , input);
		
		// dt 부다 일주일 내에 있으면 체크 컬럼명 '경고'
		Calendar cal = new GregorianCalendar();
		cal.setTime(Ut.str2date(dt));
		cal.add(Calendar.DATE, 7);
		Date t1_upper = cal.getTime();
		
		for(int i=0; i<outItemHist.size(); i++){
			
			if(((String)outItemHist.get(i).get("최근이자지급일")).compareTo("할인채") != 0){
				Date exp_dt = Ut.str2date((String)outItemHist.get(i).get("만기일"));
				Date int_dt = Ut.str2date((String)outItemHist.get(i).get("최근이자지급일"));
				
				if(exp_dt.before(t1_upper) || int_dt.before(t1_upper)) {
					outItemHist.get(i).put("경고", "경고");
				}
				else{
					outItemHist.get(i).put("경고", "없음");
				}
			}
			else{
				outItemHist.get(i).put("경고", "없음");
			}
		}
		
		model.addAttribute("type", "url");		
		model.addAttribute("outUNm", "국고채");
		model.addAttribute("dt", dt);
		
		model.addAttribute("contents", "contents_bond/ktb.jsp");
		
		return "template";
	}
}
