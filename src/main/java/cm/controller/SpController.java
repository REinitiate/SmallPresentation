package cm.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.apache.commons.io.IOUtils;

import cm.service.LetterService;
import cm.service.LetterService.Letter;
import cm.service.LoginService;
import fnlab.utility.Ut;

/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class SpController {
	/*
	 * ImageView는 파일 시스템에 있는 이미지 파일을 응답으로 돌려주는 역할을 합니다.
	 * 뒷 부분에서 ImageView 클래스를 작성하게 됩니다.
	 */
	@Resource(name="imageView") ImageView imageView;

	/**
	 * 이미지를 관리하는 서비스 계층 클래스입니다. 예제에서는 디비를 사용하긴 버거워지므로
	 * 서비스 클래스를 따라하는 모양만 서비스인 클래스입니다.
	 */
	@Autowired ImageService imageService;
	@Autowired LoginService loginService;
	@Autowired LetterService letterService;
	
	/**
	 * 이미지 업로드를 위한 페이지 매핑 
	 */
	
	@RequestMapping(value={"", "/"}, method = {RequestMethod.GET})
	private String home() {
		return "login";
	}
	
	// 로그인
	@RequestMapping(value={"/login"}, method = {RequestMethod.POST})
	private String home(@RequestParam String email, @RequestParam String pass, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		Ut.Log(email);
		Ut.Log(pass);
		
		String id = loginService.CheckIdExist(email);
		if(id == null){
			// 아이디 등록
			loginService.RegisterUser(email, pass);
			request.getSession().setAttribute("id", email);			
			return "upload";
		}
		else{
			// 아이디 원래 있음
			String passDb = loginService.GetPassword(id);
			if(pass.compareTo(passDb) == 0){
				request.getSession().setAttribute("id", email);				
				List<HashMap> letters = letterService.GetLetterHashListById(email);
				
				model.addAttribute("letter_list", letters);				
				return "upload";
			}
			else{
				return "/";
			}			
		}
	}
	
	// 편지보기
	@RequestMapping(value={"/view"}, method = {RequestMethod.GET})
	private String letter(@RequestParam String page_id, HttpServletRequest request, HttpServletResponse response, Model model) {		
		String json = letterService.GetJsonByPageId(page_id);
		JSONObject data = new JSONObject();
		data.put("page_list", json);
		model.addAttribute("page_list", json);
		return "view";
	}
	
	@RequestMapping(value={"/loginMain"}, method = {RequestMethod.GET})
	private String homeMain(HttpServletRequest request, HttpServletResponse response, Model model) {		
		
		String id = (String) request.getSession().getAttribute("id");		
		if(id == null){
			return "login";
		}
		List<HashMap> letters = letterService.GetLetterHashListById(id);				
		model.addAttribute("letter_list", letters);				
		return "upload";
	}
	
	/**
	 * 편지 저장 메서드 
	 */	
	@RequestMapping(value = "/letter", method = RequestMethod.POST)
	private String upload(@RequestParam String page_list, @RequestParam String page_id, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String temp = request.getParameter("page_list");		
		JSONTokener tokener = new JSONTokener(page_list);
		JSONObject data = new JSONObject(tokener);
		String jsonString = data.toString();
		jsonString = jsonString.replace("\\n", "|");
		Ut.Log(jsonString);		
		String title = data.getString("title");		
		
		String id = (String) request.getSession().getAttribute("id");
		if(id == null){
			return "login";
		}
		else
		{
			// 페이지 할당을 항상 새로 하는 것이 아니라 페이지 아이디가 같이 들어오면 동일한 페이지 아이디를 할당해준다.
			
			String page_id_new = null;
			if(page_id.compareTo("")==0){
				page_id_new = "page-" + UUID.randomUUID().toString();
			}else{
				page_id_new = page_id;
			}
			letterService.ReplaceLetter(id, title, jsonString, page_id_new);
		} 
		model.addAttribute("page_list", jsonString);
		return "letter";
	}
	
	@ResponseBody
	@RequestMapping(value = "/upload", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf-8")
	private String upload(@RequestParam MultipartFile imageFile) {
		ImageFile fileInfo = imageService.save(imageFile);		
		//modelMap.put("imageFile", fileInfo);
		
		JSONObject result = new JSONObject();
		JSONObject file1 = new JSONObject();
		file1.put("id", fileInfo.getId());
		file1.put("name", "name");
		file1.put("size", 902604);
		file1.put("url", "image/" + fileInfo.getFileName());
		file1.put("deleteUrl", "deleteUrl");
		file1.put("deleteType", "DELETE");
		
		JSONArray files = new JSONArray();
		files.put(file1);
		result.put("files", files);	
		Ut.Log(result.toString());
		return result.toString();
	}
	
//	@RequestMapping("/image/{imageId}")
//	private ImageView getImage(@PathVariable String imageId, ModelMap modelMap) {
//		ImageFile imageFile = imageService.get(imageId);		
//		modelMap.put("imageFile", imageFile);		
//		return imageView;
//	}
	
	@RequestMapping(value="/image/{imageId}", method={RequestMethod.GET}, produces={"image/jpg", "image/png"})
	@ResponseBody public byte[] getImage(HttpServletRequest request, @PathVariable String imageId, HttpServletResponse resp) throws IOException {

		//String realPath = ImageFile.IMAGE_DIR + imageId + ".jpg";
		
		String realPath = ImageFile.IMAGE_DIR + imageId.replace("|", ".");
		String[] types = imageId.split("|");
		String type = imageId.split("\\|")[1];
		
        try {
            InputStream is = new FileInputStream(realPath);
            BufferedImage img = ImageIO.read(is);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            ImageIO.write(img, type, bos);
            return bos.toByteArray();
        } catch (FileNotFoundException e) {
            return null; //todo: return safe photo instead
        } catch (IOException e) {
            return null;  //todo: return safe photo instead
        }
	}
}