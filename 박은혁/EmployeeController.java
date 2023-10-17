package com.green.distribution.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.distribution.model.Employee;
import com.green.distribution.service.EmployeeService;

@Controller
public class EmployeeController {
@Autowired
private EmployeeService es;

@RequestMapping("emp")
public String emp(Model model, Employee employee) {
	
	int rowPerPage = 20 ;
	
	if (employee.getRowPerPage() != 0) {
		rowPerPage = employee.getRowPerPage();
	} 
	if (employee.getPageNum() == null || employee.getPageNum().equals("")) {
		employee.setPageNum("1");
	}
	
	employee.setDEL("N");
	
	int currentPage = Integer.parseInt(employee.getPageNum());
	int total = es.getTotal(employee);
	
	employee.pagingBean(currentPage, rowPerPage, total);
	int startRow = (currentPage - 1) * rowPerPage + 1;
	int endRow = startRow + rowPerPage - 1;
	employee.setStartRow(startRow);
	employee.setEndRow(endRow);
	
	employee.setSORTEMPCD(0);
	employee.setSORTENAME(0);
	employee.setSORTADDDATE(1);
	employee.setSORTJOB(0);
	employee.setSORTDEPT(0);
	employee.setSORTAUTHORITY(0);
	
	List<Employee> empList = es.search(employee);
	
	model.addAttribute("empList", empList);
	
	return "nolay/emp";
}

@RequestMapping("empInsert")
@ResponseBody
public boolean empInsert(Model model, Employee employee) {
	
	boolean result = true;
	
	try {
		es.insert(employee);
	} catch (Exception e) {
		System.out.println(e.getMessage());
		result = false;
	}
	
	return result;
}
}

/*
 * @GetMapping("/nolay/employeeList") public void employeeList(Model model) {
 * List<Employee> employeeList = es.list(); model.addAttribute("employeeList",
 * employeeList); } }
 */
// 엑셀 출력
//try {
//    wb.write(response.getOutputStream());
//} finally {
//    wb.close();
//}
