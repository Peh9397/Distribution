package com.green.distribution.service;

import java.util.List;

import com.green.distribution.model.Employee;

public interface EmployeeService {

	List<Employee> list();

	int getTotal(Employee employee);

	List<Employee> search(Employee employee);

	void insert(Employee employee);

	void update(Employee employee);

	void employeeDelete(String EMPCD);

	void employeeRestore(String EMPCD);

	int getSALCount(String DEPT);

	Employee listForExcel(Employee item);

}
