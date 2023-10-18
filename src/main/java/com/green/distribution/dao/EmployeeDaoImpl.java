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
	@Override
	public void update(Employee employee) {
		sst.update("employeens.update", employee);
	}
	@Override
	public void employeeDelete(String EMPCD) {
		sst.update("employeens.employeeDelete", EMPCD);
	}
	@Override
	public void employeeRestore(String EMPCD) {
		sst.update("employeens.employeeRestore", EMPCD);
	}
	@Override
	public int getSALCount(String DEPT) {
		return sst.selectOne("employeens.getSALCount", DEPT);
	}
	@Override
	public Employee listForExcel(Employee item) {
		return sst.selectOne("employeens.listForExcel", item);
	}
}