package com.green.distribution.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.green.distribution.model.Employee;

public class AuthorityChk extends HandlerInterceptorAdapter{
	
	@Autowired
	private EmployeeService es;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		HttpSession session = request.getSession();
		String EMPCD = (String) session.getAttribute("EMPCD");
		
		Employee employee = es.select(EMPCD);
		
		if (employee.getAUTHORITY().equals("N")) {
			response.sendRedirect("check.do");
			
			return false;
		}
		
		
		return true;
	}
}