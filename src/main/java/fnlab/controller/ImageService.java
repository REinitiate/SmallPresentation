package fnlab.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import fnlab.utility.Ut;

@Service
public class ImageService {
	private Map imageFilesMap;
	
	public ImageService() {
		init();
	}
	
	/**
	 * 초기화
	 */
	private void init() {
		imageFilesMap = new HashMap();
	}
	
	/**
	 * ID로 이미지 파일 가져오기
	 */
	public ImageFile get(String id) {		
		return (ImageFile) imageFilesMap.get(id);
	}
	
	/**
	 * Multipart File을 파일로 저장하고 DB(를 빙자한 맵)에 업로드 파일 정보 저장, 실패하는 경우 null리
	 */
	public ImageFile save(MultipartFile multipartFile) {
		// UUID로 유일할 것 같은 값 생성.. 낮은 확률로 중복 가능성이 있음
		String genId = UUID.randomUUID().toString();
		ImageFile imageFile = null;
		
		try {
			String savedFileName = saveToFile(multipartFile, genId);
			genId = savedFileName.replace(".", "|");
			imageFile = new ImageFile(genId, 
					multipartFile.getContentType(),
					(int)multipartFile.getSize(),
					savedFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return imageFile;
	}
	
	/**
	 * Multipart File의 내용을 파일로 저장, 저장 후 저장된 파일 이름을 반환
	 */
	private String saveToFile(MultipartFile src, String id) throws IOException {
		
		// 이슈 1. pong일 경우에 파일 이미지 음영이 이상해짐
		if(src.getContentType().compareTo("image/png") == 0){
			Ut.Log("png");
		}
		
		String fileName = src.getOriginalFilename();
		byte[] bytes = src.getBytes(); // 이미지 바이트
		
		final float FACTOR  = 4f;
		
		BufferedImage bufferedImage = ImageIO.read(src.getInputStream()); //이미지 갖고오기	
		
		
		double width = (double)(bufferedImage.getWidth() * FACTOR);
		double height = (double)(bufferedImage.getHeight() * FACTOR);
		
		height = height / width;
		width = 1;
		
		int type = bufferedImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : bufferedImage.getType();		
		BufferedImage resizeImage = null;
		
		resizeImage = resizeImage(bufferedImage, type, (int)(width * 500), (int)(height * 500));
		//resizeImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
		
		String saveFileName = id + "." + getExtension(fileName);
		//String saveFileName = id + "." + "jpg";
		String savePath = ImageFile.IMAGE_DIR + saveFileName;
		
		File outputfile = new File(savePath);
		
		if(src.getContentType().compareTo("image/png") == 0){
			Ut.Log("png");
			ImageIO.write(resizeImage, "png", outputfile);
		}else if(src.getContentType().compareTo("image/jpg") == 0){
			ImageIO.write(resizeImage, "jpg", outputfile);
		}else if(src.getContentType().compareTo("image/jpeg") == 0){
			ImageIO.write(resizeImage, "jpg", outputfile);
		}
		
		return saveFileName;
	}
	
	private static BufferedImage resizeImage(BufferedImage originalImage, int type, int IMG_WIDTH, int IMG_HEIGHT) {
	    BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
	    Graphics2D g = resizedImage.createGraphics();
	    g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
	    g.dispose();

	    return resizedImage;
	}
	
	/**
	 * 파일이름으로부터 확장자를 반환하는 메서드
	 * 파일이름에 확장자 구분을 위한 . 문자가 없거나. 가장 끝에 있는 경우는 빈문자열 ""을 리턴
	 */
	private String getExtension(String fileName) {
		int dotPosition = fileName.lastIndexOf('.');
		
		if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
			return fileName.substring(dotPosition + 1);
		} else {
			return "";
		}
	}
}