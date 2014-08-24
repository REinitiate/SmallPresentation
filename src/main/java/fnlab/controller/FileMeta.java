package fnlab.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

//ignore "bytes" when return json format
@JsonIgnoreProperties({"bytes"}) 
public class FileMeta {

  private String fileName;
  private String fileSize;
  private String fileType;

  private byte[] bytes;

	public void setFileName(String originalFilename) {
		// TODO Auto-generated method stub
		fileName = originalFilename;	
	}
	
	public void setFileSize(String string) {
		// TODO Auto-generated method stub
		fileSize = string;
		
	}
	
	public void setBytes(byte[] bytes2) {
		// TODO Auto-generated method stub
		bytes = bytes2;
		
	}
	
	public void setFileType(String contentType) {
		// TODO Auto-generated method stub
		fileType = contentType;	
	}

	public String getFileType() {
		// TODO Auto-generated method stub
		return fileType;
	}

	public String getFileName() {
		// TODO Auto-generated method stub
		return fileName;
	}

	public InputStream getBytes() {
		// TODO Auto-generated method stub
		// 여긴 잘 모르겠군
		InputStream myInputStream = new ByteArrayInputStream(bytes);
		return myInputStream;
	}
  
       //setters & getters
}