package cm.service;

import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class LoginService extends SqlSessionDaoSupport{
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
	
	public String GetPassword(String id){
		String result = (String) getSqlSession().selectOne("login.selectPassById", id);		
		return result;
	}
}
