package com.green.distribution.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.distribution.model.Employee;
import com.green.distribution.service.EmployeeService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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

@RequestMapping("empSearch")
public String empSearch(Model model, @RequestParam(name="keyword") String keyword) {
	
	System.out.println("1");
	
	try {
		
		JSONParser p = new JSONParser();
		Object obj = p.parse(keyword);
		JSONObject keywordObj = JSONObject.fromObject(obj);
		
		Employee employee = new Employee();
		
		String EMPCD = (String) keywordObj.get("EMPCD");
		employee.setEMPCD(EMPCD);
		String ENAME = (String) keywordObj.get("ENAME");
		employee.setENAME(ENAME);
		String JOB = (String) keywordObj.get("JOB");
		employee.setJOB(JOB);
		String DEPT = (String) keywordObj.get("DEPT");
		employee.setDEPT(DEPT);
		
		String ADDFROMDATE = (String) keywordObj.get("ADDFROMDATE");
		if (ADDFROMDATE != null && !ADDFROMDATE.equals("") ) {
			Date date = Date.valueOf(ADDFROMDATE);
			employee.setADDFROMDATE(date);
		}
		
		String ADDTODATE = (String) keywordObj.get("ADDTODATE");
		if (ADDTODATE != null && !ADDTODATE.equals("") ) {
			Date date = Date.valueOf(ADDTODATE);
			employee.setADDTODATE(date);
		}
		
		System.out.println("4");
		
		String AUTHORITY = (String) keywordObj.get("AUTHORITY");
		employee.setAUTHORITY(AUTHORITY);
		
		String DEL = (String) keywordObj.get("DEL");
		employee.setDEL(DEL);
		
		int SORTEMPCD = Integer.valueOf((String) keywordObj.get("SORTEMPCD"));
		employee.setSORTEMPCD(SORTEMPCD);
		int SORTENAME = Integer.valueOf((String) keywordObj.get("SORTENAME"));
		employee.setSORTENAME(SORTENAME);
		int SORTJOB = Integer.valueOf((String) keywordObj.get("SORTJOB"));
		employee.setSORTJOB(SORTJOB);
		int SORTDEPT = Integer.valueOf((String) keywordObj.get("SORTDEPT"));
		employee.setSORTDEPT(SORTDEPT);
		int SORTADDDATE = Integer.valueOf((String) keywordObj.get("SORTADDDATE"));
		employee.setSORTADDDATE(SORTADDDATE);
		int SORTAUTHORITY = Integer.valueOf((String) keywordObj.get("SORTAUTHORITY"));
		employee.setSORTAUTHORITY(SORTAUTHORITY);			
		
		int rowPerPage = Integer.valueOf((String) keywordObj.get("rowPerPage"));
		int currentPage = Integer.valueOf((String) keywordObj.get("currentPage"));
		int total = es.getTotal(employee);
		
		employee.pagingBean(currentPage, rowPerPage, total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		employee.setStartRow(startRow);
		employee.setEndRow(endRow);
		
		List<Employee> empList = es.search(employee);
		System.out.println(empList.size());
		
		for (Employee oh : empList) {
			System.out.println(oh.toString());
		}
		
		model.addAttribute("empList", empList);
		model.addAttribute("employee", employee);
		
	} catch (ParseException e) {
		System.out.println(e.getMessage());
	}
	
	return "nolay/emp";
}

@RequestMapping("empUpdate.do")
@ResponseBody
public boolean empUpdate(Employee employee) {
	System.out.println(employee.getEMPCD());
	boolean result = true;
	
	try {
		es.update(employee);
	} catch (Exception e) {
		System.out.println(e.getMessage());
		result = false;
	}
	
	return result;
}

@RequestMapping("employeeDelete")
@ResponseBody
public boolean employeeDelete(String[] checkRows) {
	boolean result = true;
	
	for (String EMPCD : checkRows){
		try {
			es.employeeDelete(EMPCD);
		} catch (Exception e) {
			System.out.println("실패 : " + EMPCD);
			result = false;
		}			
	}
	return result;
}

@RequestMapping("employeeRestore")
@ResponseBody
public boolean employeeRestore(String[] checkRows) {
	boolean result = true;
	
	for (String EMPCD : checkRows){
		try {
			es.employeeRestore(EMPCD);
		} catch (Exception e) {
			System.out.println("실패 : " + EMPCD);
			result = false;
		}			
	}
	return result;
}

@RequestMapping("getSALCount")
@ResponseBody
public String getSALCount(String DEPT) {
	int count = es.getSALCount(DEPT);
	String number = String.format("%03d", count);
	
	System.out.println(number);
	
	return number;
}

@RequestMapping("empExcelDown")
@ResponseBody
public void orderExcelDown(HttpServletResponse response, @RequestParam(name="items")String items) throws IOException {
	System.out.println("시작");
	//List<OrderHead> list = is.search(checkRow); List<OrderHead> checkRow,
	// 출력할 주문리스트
	List<Employee> list = new ArrayList<>();
	
	Employee orderRow = new Employee();

	try {
		JSONParser p = new JSONParser();
		Object obj = p.parse(items);
		JSONArray arr = JSONArray.fromObject(obj);
		
		System.out.println("1");
		
		Employee item = new Employee();
		
		for (int i = 0; i < arr.size(); i++) {
			
			JSONObject itemObj = (JSONObject) arr.get(i);
			String EMPCD = (String) itemObj.get("EMPCD");
			System.out.println(EMPCD);
			
			item.setEMPCD(EMPCD);
			
			System.out.println("sql전");
			orderRow = es.listForExcel(item);
			System.out.println("sql후");
			list.add(orderRow);
		}
		
		
	} catch (ParseException e) {
		System.out.println(e.getMessage());
	}
	
	
	System.out.println("size"+list.size());
	
	// 워크북 생성
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("주문 현황");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
			
			// 테이블 헤더용 스타일
			CellStyle headStyle = wb.createCellStyle();
			
			// 가는 경계선
			headStyle.setBorderTop(BorderStyle.THIN);
		    headStyle.setBorderBottom(BorderStyle.THIN);
		    headStyle.setBorderLeft(BorderStyle.THIN);
		    headStyle.setBorderRight(BorderStyle.THIN);

		    // 배경색 노란색
		    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		    
		    // 데이터 가운데 정렬
		    headStyle.setAlignment(HorizontalAlignment.CENTER);
		    
		    // 데이터용 경계 스타일 테두리만 지정
		    CellStyle bodyStyle = wb.createCellStyle();
		    bodyStyle.setBorderTop(BorderStyle.THIN);
		    bodyStyle.setBorderBottom(BorderStyle.THIN);
		    bodyStyle.setBorderLeft(BorderStyle.THIN);
		    bodyStyle.setBorderRight(BorderStyle.THIN);
		    
		    // 헤더 생성
		    row = sheet.createRow(rowNo++);
		    
		    cell = row.createCell(0);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("직원코드");
		    
		    cell = row.createCell(1);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("직원명");
		    
		    cell = row.createCell(2);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("직책");
		    
		    cell = row.createCell(3);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("부서");
		    
		    cell = row.createCell(4);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("등록일");
		    
		    cell = row.createCell(5);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("승인권한");
		    
		    cell = row.createCell(6);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("상태변경일");
		    
		    
		 // 데이터 부분 생성
		    for(Employee li : list) {

		        row = sheet.createRow(rowNo++);

		        cell = row.createCell(0);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(li.getEMPCD());
		        System.out.println(li.getEMPCD());
		        
			    cell = row.createCell(1);
			    cell.setCellStyle(bodyStyle);
			    cell.setCellValue(li.getENAME());
			    System.out.println(li.getENAME());
			    
			    cell = row.createCell(2);
			    cell.setCellStyle(bodyStyle);
			    cell.setCellValue(li.getJOB());
			    System.out.println(li.getJOB());
			    
			    cell = row.createCell(3);
			    cell.setCellStyle(bodyStyle);
			    cell.setCellValue(li.getDEPT());
			    System.out.println(li.getDEPT());
			    
			    cell = row.createCell(4);
			    cell.setCellStyle(bodyStyle);
			    cell.setCellValue(li.getADDDATE().toString());
			    System.out.println(li.getADDDATE().toString());
			    
			    cell = row.createCell(5);
			    cell.setCellStyle(bodyStyle);
			    cell.setCellValue(li.getAUTHORITY());
			    System.out.println(li.getAUTHORITY());
			    
			    cell = row.createCell(6);
			    cell.setCellStyle(bodyStyle);
			    cell.setCellValue(li.getSTATEDATE().toString());
			    System.out.println(li.getSTATEDATE().toString());
		    }
		
		    // 컨텐츠 타입과 파일명 지정
		    response.setContentType("ms-vnd/excel");
		    response.setHeader("Content-Disposition", "attachment;filename=order.xlsx");
		    
		    // 엑셀 출력
		    try {
	            wb.write(response.getOutputStream());
	        } finally {
	            wb.close();
	        }
		    
		    
		}
		
	}