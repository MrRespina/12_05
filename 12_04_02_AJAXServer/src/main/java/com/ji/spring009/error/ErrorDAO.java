package com.ji.spring009.error;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ErrorDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getAllError(HttpServletRequest req) {
		
		try {
			req.setAttribute("errors", ss.getMapper(errorMapper.class).searchAllError());
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
	}
	
	public Errors getJson(HttpServletRequest req) {
		
		return new Errors(ss.getMapper(errorMapper.class).searchAllError());
		
	}
	
	public Errors searchJson(HttpServletRequest req,Error e) {
		
		return new Errors(ss.getMapper(errorMapper.class).searchError(e));
		
	}

}
