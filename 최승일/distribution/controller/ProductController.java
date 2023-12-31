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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.distribution.service.ProductService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.green.distribution.model.PagingBean;
import com.green.distribution.model.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductService pds;
	
	@RequestMapping("productList")
	public String productList(Model model, PagingBean pagingBean, String pageNum, Product product, String page) {
		int rowPerPage = 5 ; // 한 화면에 보여주는 갯수
		if (page == null || page == "") {
			rowPerPage = 5;
		}else rowPerPage = Integer.parseInt(page);
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		product.setDel("n");
		int total = pds.getTotal(pagingBean,product);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int num = total - startRow + 1;
		pagingBean.setStartRow(startRow);
		pagingBean.setEndRow(endRow);
		product.setSortAddDate(1);
		product.setSortCategory(0);
		product.setSortDel(0);
		product.setSortPname(0);
		product.setSortProductCd(0);
		product.setSortUnit(0);
		product.setSortStatedate(0);
		product.setSortStock(0);
		
		List<Product> productList = pds.productList(pagingBean,product);
		List<Product> allList = pds.allList();
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("productList",productList);
		model.addAttribute("num",num);
		model.addAttribute("pb",pb);
		model.addAttribute("product",product);
		model.addAttribute("rowPerPage",rowPerPage);
		model.addAttribute("allList",allList);
		
		return "/nolay/productList";
	}
	@RequestMapping("productDelete")
	@ResponseBody
	public int productDelete(@RequestParam(name="checkRows")List<String> checkRows){
		int result = 0;
			for (int i= 0; i < checkRows.size(); i++) {
				String productCd = checkRows.get(i);
				result = pds.checkRowDelete(productCd);			
				}
		return result;
	}
	@RequestMapping("productInsert")
	@ResponseBody
	public int productInsert(@RequestParam(name="items")String item) throws ParseException{
		int result = 0;
		JSONParser p = new JSONParser();
		Object obj =  p.parse(item);
		JSONObject productObj = JSONObject.fromObject(obj);
		
		Product product = new Product();
		String category = (String) productObj.get("category");
		String productCd = (String) productObj.get("productCd");
		String pname = (String) productObj.get("pname");
		int stock =Integer.parseInt((String)productObj.get("stock"));
		String unit = (String) productObj.get("unit");
		if(category.equals("") ) {
			result = -2;
			return result;
		}else if(pname.equals("") ){
			result = -3;
			return result;
		}else if(Integer.toString(stock).equals("")) {
			result = -4;
			return result;
		}else if(unit.equals("") ) {
			result = -5;
			return result;
		}
		
		product.setCategory(category);
		product.setProductCd(productCd);
		product.setPname(pname);
		product.setStock(stock);
		product.setUnit(unit);
		
		Product product2 = pds.insertselect(product);
		if(product2 != null) {
			result=-1;
			return result; 
		}else 
	
		result = pds.insert(product);
		return result;
		
	}
	@RequestMapping("codeMix")
	@ResponseBody
	public String codeMix(@RequestParam(name="category")String codeMix) throws ParseException{
		String code1= "";
		String code2= "";
		if(codeMix.equals("스낵")) {
			code1 = "SN";
			code2 = pds.selectCode(codeMix);
			
		}else if(codeMix.equals("라면")){
			code1 = "RA";
			code2 = pds.selectCode(codeMix);
		}else {
			code1 = "DR";
			code2 = pds.selectCode(codeMix);
		}
		
		return code1+code2;
	}

	@RequestMapping("productUpdate") 
	@ResponseBody
	public int productUpdate(Product product) {
		int result = 0;
		System.out.println(product.getCategory());
		System.out.println(product.getStock());
		System.out.println(product.getUnit());
		System.out.println(product.getProductCd());
		Product product2 = pds.updateselect(product);
		if (product2 != null) {
			result = -1;
			return result;
		} else {

			result = pds.update(product);
			return result;
		}
	}
		@RequestMapping("productSearch")
		public String productSearch(@RequestParam(name="keyword",required=false)String keyword, String pageNum, PagingBean pagingBean,String page, Model model ){
			
			try {
				JSONParser p = new JSONParser();
				Object obj = p.parse(keyword);
				JSONObject keywordObj = JSONObject.fromObject(obj);
				Product product = new Product();
				String productCd = (String) keywordObj.get("productCd");
				product.setProductCd(productCd);
				String pname = (String) keywordObj.get("pname");
				product.setPname(pname);
				int stock =Integer.parseInt((String) keywordObj.get("stock"));
				product.setStock(stock);
				String category = (String) keywordObj.get("category");
				product.setCategory(category);
				
				int currentPage = Integer.valueOf((String) keywordObj.get("currentPage"));
				pagingBean.setCurrentPage(currentPage);
				int sortProductCd = Integer.valueOf((String) keywordObj.get("sortProductCd"));
				product.setSortProductCd(sortProductCd);
				int sortPname = Integer.valueOf((String) keywordObj.get("sortPname"));
				product.setSortPname(sortPname);
				int sortStock = Integer.valueOf((String) keywordObj.get("sortStock"));
				product.setSortStock(sortStock);
				int sortUnit = Integer.valueOf((String) keywordObj.get("sortUnit"));
				product.setSortUnit(sortUnit);
				int sortCategory = Integer.valueOf((String) keywordObj.get("sortCategory"));
				product.setSortCategory(sortCategory);
				int sortAddDate = Integer.valueOf((String) keywordObj.get("sortAddDate"));
				product.setSortAddDate(sortAddDate);
				int sortStatedate = Integer.valueOf((String) keywordObj.get("sortStatedate"));
				product.setSortStatedate(sortStatedate);
				int sortDel = Integer.valueOf((String) keywordObj.get("sortDel"));
				product.setSortDel(sortDel);
				String addDate = (String) keywordObj.get("addDate");
				if (addDate != null && !addDate.equals("") ) {
					Date date = Date.valueOf(addDate);
					product.setAddDate(date);
				}
				
				String addDate2 = (String) keywordObj.get("addDate2");
				if (addDate2 != null && !addDate2.equals("") ) {
					Date date = Date.valueOf(addDate2);
					product.setAddDate2(date);
				}
				
				
				String del = (String) keywordObj.get("del");
				product.setDel(del);
				
				// item 검색
				
				int rowPerPage = 20 ; // 한 화면에 보여주는 갯수
				if (page == null || page == "") {
					rowPerPage = 20;
				}else rowPerPage = Integer.parseInt(page);
				if (pageNum == null || pageNum.equals("")) pageNum = "1";
				int total = pds.getTotal(pagingBean,product);
				int startRow = (currentPage - 1) * rowPerPage + 1;
				int endRow = startRow + rowPerPage - 1;
				int num = total - startRow + 1;
				pagingBean.setStartRow(startRow);
				pagingBean.setEndRow(endRow);
				
				List<Product> productList = pds.productList(pagingBean,product);
				List<Product> allList = pds.allList();
				PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
				model.addAttribute("productList",productList);
				model.addAttribute("num",num);
				model.addAttribute("pb",pb);
				model.addAttribute("product",product);
				model.addAttribute("rowPerPage",rowPerPage);
				model.addAttribute("allList",allList);
				
			} catch (ParseException e) {
				System.out.println(e.getMessage());
			}
				return "nolay/productList";
		}

		@RequestMapping("productExcelDown")
		@ResponseBody
		public void excelDown( HttpServletResponse response,	@RequestParam(name="items")String items) throws IOException {
			
			List<Product> list = new ArrayList<>();
			Product product = new Product();
			try {
				JSONParser p = new JSONParser();
				Object obj = p.parse(items);
				JSONArray arr = JSONArray.fromObject(obj);
				
				System.out.println("1");
				
				Product item = new Product();
				
				for (int i = 0; i < arr.size(); i++) {
					
					JSONObject itemObj = (JSONObject) arr.get(i);
					String productCd = (String) itemObj.get("productCd");
					
					item.setProductCd(productCd);
					
					product = pds.listForExcel(item);
					product.getAddDate();
					list.add(product);
				}
				
				
			} catch (ParseException e) {
				System.out.println(e.getMessage());
			}
				
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
			    
			    row = sheet.createRow(rowNo++);
			    
			    cell = row.createCell(0);
			    cell.setCellStyle(headStyle);
			    cell.setCellValue("상품코드");
			    
			    cell = row.createCell(1);
			    cell.setCellStyle(headStyle);
			    cell.setCellValue("상품명");
			    
			    cell = row.createCell(2);
			    cell.setCellStyle(headStyle);
			    cell.setCellValue("재고");
			    
			    cell = row.createCell(3);
			    cell.setCellStyle(headStyle);
			    cell.setCellValue("단위");
			    
			    cell = row.createCell(4);
			    cell.setCellStyle(headStyle);
			    cell.setCellValue("상품카테고리");
			    
			    cell = row.createCell(5);
			    cell.setCellStyle(headStyle);
			    cell.setCellValue("등록일");
			    
			    cell = row.createCell(6);
			    cell.setCellStyle(headStyle);
			    cell.setCellValue("최종수정일");
			    
			    cell = row.createCell(7);
			    cell.setCellStyle(headStyle);
			    cell.setCellValue("삭제여부");
			    
			    for(Product li : list) {
			    	row = sheet.createRow(rowNo++);

			        cell = row.createCell(0);
			        cell.setCellStyle(bodyStyle);
			        cell.setCellValue(li.getProductCd());
			        
				    cell = row.createCell(1);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue(li.getPname());
				    
				    cell = row.createCell(2);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue(li.getStock());
				    
				    cell = row.createCell(3);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue(li.getUnit());
				    
				    cell = row.createCell(4);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue(li.getCategory());
				    
				    cell = row.createCell(5);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue(li.getAddDate().toString());
				    
				    
				    cell = row.createCell(6);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellStyle(bodyStyle);
					if (li.getStatedate() != null) {
						cell.setCellValue(li.getStatedate().toString());
					}else {
						cell.setCellValue(li.getStatedate());
						
					}
				    cell = row.createCell(7);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue(li.getDel());
			    }
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

