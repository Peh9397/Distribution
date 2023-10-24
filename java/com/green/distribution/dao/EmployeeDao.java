package com.green.distribution.dao;

import java.util.List;

import com.green.distribution.model.Employee;

public interface EmployeeDao {

	List<Employee> list();

	List<Employee> search(Employee employee);

	int getTotal(Employee employee);

	void insert(Employee employee);

	void update(Employee employee);

	void employeeDelete(String EMPCD);

	void employeeRestore(String eMPCD);

	int getSALCount(String DEPT);

	Employee listForExcel(Employee item);

	Employee select(String eMPCD);

}