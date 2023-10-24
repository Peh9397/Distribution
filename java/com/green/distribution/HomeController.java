package com.green.distribution;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.distribution.model.Employee;
import com.green.distribution.service.EmployeeService;

@Controller
public class HomeController {	
	@Autowired
	private EmployeeService es;
	
	@GetMapping("nolay/loginForm")
	public String loginForm() {
		return "/nolay/loginForm";
	}
	
	@PostMapping("login")
	public String login(Employee employee, Model model, HttpSession session) {
		Employee emp2 = es.select(employee.getEMPCD());
		int result = 0;
		if (emp2 == null) result = -1;	// 없는cd
		else if (employee.getPASSWORD().equals(employee.getPASSWORD())) {
			result = -1;	// 성공(일치)
		}
		model.addAttribute("result", result);
		return "/login";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "logout";
	}
		
}
