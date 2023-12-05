package com.ji.spring009.error;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ErrorController {
	
	@Autowired
	private ErrorDAO eDAO;

	@RequestMapping(value = "/error.go", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		eDAO.getAllError(req);
		req.setAttribute("r", "에러 연결 성공!");
		return "index";
		
	}
	
	@RequestMapping(value = "/error.getAllJSON", method = RequestMethod.GET
			,produces = "application/json; charset=UTF-8")
	public @ResponseBody Errors getAllErrorJson(HttpServletRequest req,HttpServletResponse res) {
		
		// 해당 사이트 외부에서 AJAX 가능하게 하려면 응답 파라미터(response) 를 추가하고
		// HeaderCode를 추가.
		res.addHeader("Access-Control-Allow-Origin", "*");
		return eDAO.getJson(req);
		
	}
	@RequestMapping(value = "/error.searchJSON", method = RequestMethod.GET
			,produces = "application/json; charset=UTF-8")
	public @ResponseBody Errors searchErrorJson(HttpServletRequest req,Error e) {
		
		return eDAO.searchJson(req, e);
		
	}
	
}
