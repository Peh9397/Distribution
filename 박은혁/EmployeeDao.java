package com.green.distribution.dao;

import java.util.List;

import com.green.distribution.model.Employee;

public interface EmployeeDao {

	List<Employee> list();

	List<Employee> search(Employee employee);

	int getTotal(Employee employee);

	void insert(Employee employee);

}
