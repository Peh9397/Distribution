package com.green.distribution.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.distribution.model.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {
	@Autowired
	private SqlSessionTemplate sst;
	public List<Employee> list() {
		return sst.selectList("employeens.list");
	}
	@Override
	public List<Employee> search(Employee employee) {
		return sst.selectList("employeens.search", employee);
	}
	@Override
	public int getTotal(Employee employee) {
		return sst.selectOne("employeens.getTotal", employee);
	}
	@Override
	public void insert(Employee employee) {
		sst.insert("employeens.insert", employee);
	}
}
