package com.green.distribution.service;

import java.util.List;

import com.green.distribution.model.Employee;

public interface EmployeeService {

	List<Employee> list();

	void insert(Employee employee);

	List<Employee> search(Employee employee);

	void update(Employee employee);

	Employee select(String employeeCd);

	int getTotal(Employee employee);

	void employeeDelete(String employeeCd);

	void employeeRestore(String employeeCd);

	int getSALCount(String department);

	Employee listForExcel(Employee item);


}
