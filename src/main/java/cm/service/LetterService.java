package cm.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class LetterService extends SqlSessionDaoSupport{
	public String CheckIdExist(String id){		
		String result = (String) getSqlSession().selectOne("login.selectId", id);		
		return result;		
	}
	
	public void RegisterUser(String email, String pass){
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("id", email);
		params.put("pass", pass);
		getSqlSession().insert("login.insertIdAndPassword", params);
	}
	
	public String GetLetterCnt(String id, String title){
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("title", title);
		String result = (String) getSqlSession().selectOne("letter.selectLetterByTitle", params);		
		return result;
	}
	
	public void ReplaceLetter(String id, String title, String json, String page_id){
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);		
		params.put("title", title);
		params.put("json", json);
		params.put("page_id", page_id);
		//params.put("json", "test");
		params.put("update_dt", new Date());
		getSqlSession().insert("letter.replaceLetter", params);
	}
	
	public ArrayList<Letter> GetLetterListById(String id){		
		List<HashMap> data = getSqlSession().selectList("letter.selectLetterList", id);		
		ArrayList<Letter> result = new ArrayList<LetterService.Letter>();
		
		for(int i=0; i<data.size(); i++){
			Letter item = new Letter();
			item.Title = (String) data.get(i).get("title");
			item.Update_dt = (Date) data.get(i).get("update_dt");
			item.Json = (String) data.get(i).get("json");
			result.add(item);
		}
		return result;
	}
	
	public List<HashMap> GetLetterHashListById(String id){		
		List<HashMap> result = getSqlSession().selectList("letter.selectLetterList", id);	
		return result;
	}
	
	public static class Letter{
		public String Title;
		public String Json;
		public Date Update_dt;
	}
}
