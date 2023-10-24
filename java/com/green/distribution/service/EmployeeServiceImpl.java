package com.green.distribution.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.distribution.dao.EmployeeDao;
import com.green.distribution.model.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	private EmployeeDao ed;
	
	public List<Employee> list() {
		return ed.list();
	}
	public int getTotal(Employee employee) {
		return ed.getTotal(employee);
	}
	public List<Employee> search(Employee employee) {
		return ed.search(employee);
	}
	public void insert(Employee employee) {
		ed.insert(employee);
	}
	@Override
	public Employee select(String empcd) {
		return ed.select(empcd);
	}
}
