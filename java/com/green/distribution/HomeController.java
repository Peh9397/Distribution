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
	
	@GetMapping("loginForm")
	public String loginForm() {
		return "/nolay/loginForm";
	}
	
	@PostMapping("login")
	public void login(Employee employee, Model model, HttpSession session) {
		int result = 0;
		Employee employee2 = es.select(employee.getEMPCD());
		if (employee2 == null || employee2.getDel().equals("y")) result = -1;	// 없는cd
		else if (employee.getPASSWORD().equals(employee2.getPASSWORD())) {
			result = 1;	// 성공(일치)
			session.setAttribute("EMPCD", employee.getEMPCD());
		}	
		model.addAttribute("result", result);
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();	// invalidate : session 데이터 지우기, logout은 세션을 날리는 것
		return "/logout";
	}
	
	@GetMapping("main")
	public String main() {
		return "/main";
	}

}
