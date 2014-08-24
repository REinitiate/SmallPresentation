package fnlab.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.apache.commons.io.IOUtils;

/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class ImageUploadController {
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
	
	/**
	 * 이미지 업로드를 위한 페이지 매핑 
	 */
	@RequestMapping("/uploadPage")
	private String uploadView() {
		return "upload";
	}
	
	/**
	 * 이미지 업로드 페이지의 폼에서 전송 시 받게 되는 메서드 
	 */
	@RequestMapping(value="/upload2", method=RequestMethod.POST)
	private String upload(@RequestParam MultipartFile imageFile, Model modelMap) {
		ImageFile fileInfo = imageService.save(imageFile);		
		//modelMap.put("imageFile", fileInfo);		
		return "uploadComplete";
	}
	
//	@RequestMapping("/image/{imageId}")
//	private ImageView getImage(@PathVariable String imageId, ModelMap modelMap) {
//		ImageFile imageFile = imageService.get(imageId);		
//		modelMap.put("imageFile", imageFile);		
//		return imageView;
//	}
	
	@RequestMapping(value="/image/{imageId}", method={RequestMethod.GET}, produces="image/jpg")
	@ResponseBody public byte[] getImage(HttpServletRequest request, HttpServletResponse resp) throws IOException {
		//curl -v http://localhost:8080/mydomain/image/get/xxx &gt; /dev/null
//        String realPath =
//                request.getSession().getServletContext().getRealPath(&quot;/resources/images/static/thumbs/&quot; + name);
		
		String realPath = "C:/Users/REinitiate/workspace_java/SmallPresentation/upload_images/de062a63-7443-4742-b303-1af2a4986073.jpg";
 
        try {
            InputStream is = new FileInputStream(realPath);
            BufferedImage img = ImageIO.read(is);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            ImageIO.write(img, "jpg", bos);
            return bos.toByteArray();
        } catch (FileNotFoundException e) {
            return null; //todo: return safe photo instead
        } catch (IOException e) {
            return null;  //todo: return safe photo instead
        }
	}
}