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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.distribution.model.Buyer;
import com.green.distribution.model.Pricing;
import com.green.distribution.model.Product;
import com.green.distribution.service.BuyerService;
import com.green.distribution.service.PricingService;
import com.green.distribution.service.ProductService;

import org.json.simple.parser.ParseException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class PricingController {
	
	 @Autowired
	 private PricingService prs;
	 @Autowired
	 private BuyerService bs;
	 @Autowired
	 private ProductService pds;
	 
	@RequestMapping("pricingList")
	public String pricingList(Model model, Pricing pricing) {
		
		int rowPerPage = 10;
		if (pricing.getRowPerPage() != 0) {
			rowPerPage = pricing.getRowPerPage();
		}
		if (pricing.getPageNum() == null || pricing.getPageNum().equals("")) {
			pricing.setPageNum("1");
		}
		pricing.setDel("n");
		pricing.setSortBuyerCd(0);
		pricing.setSortBname(0);
		pricing.setSortProductCd(0);
		pricing.setSortPname(0);
		pricing.setSortPrice(0);
		pricing.setSortStartDate(0);
		pricing.setSortEndDate(0);
		pricing.setSortDiscount(0);
		pricing.setSortFinalPrice(0);
		pricing.setSortAddDate(1);
		pricing.setSortStateDate(0);
		
		int currentPage = Integer.parseInt(pricing.getPageNum());
		int total = prs.getTotal(pricing);
		
			
		pricing.pagingBean(currentPage, rowPerPage, total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		pricing.setStartRow(startRow);
		pricing.setEndRow(endRow);
		
				
		List<Pricing> pricingList = new ArrayList<Pricing>();
		pricingList = prs.pricingList(pricing);
		
				
		for (Pricing pricing1 : pricingList) {
			pricing1.setFinalPrice(pricing1.getPrice() * (1 - ((double)pricing1.getDiscount()/100)));
		}
		
				
		List<Buyer> buyerList = bs.list();
			
		List<Product> productList = pds.allList();
				
		model.addAttribute("pricingList", pricingList);
		model.addAttribute("buyerList", buyerList);
		model.addAttribute("productList", productList);
		return "nolay/pricingList";
	}
	
	@RequestMapping("pricingSearch")
	public String pricingSearch(Model model, String keyword, Pricing pricing) {
		
		try {
			
			JSONParser p = new JSONParser();
			Object obj = p.parse(keyword);
			JSONObject keywordObj = JSONObject.fromObject(obj);
			
			String buyerCd = (String) keywordObj.get("buyerCd");
			pricing.setBuyerCd(buyerCd);
			
			String productCd = (String) keywordObj.get("productCd");
			pricing.setProductCd(productCd);
			
			int startPrice = Integer.valueOf((String)keywordObj.get("startPrice"));
			pricing.setStartPrice(startPrice);
			
			int endPrice = Integer.valueOf((String)keywordObj.get("endPrice"));
			pricing.setEndPrice(endPrice);
			
			int discount = Integer.valueOf((String)keywordObj.get("discount"));
			pricing.setDiscount(discount);
			
			String del = (String) keywordObj.get("del");
			pricing.setDel(del);
			
			int sortBuyerCd = Integer.valueOf((String) keywordObj.get("sortBuyerCd"));
			pricing.setSortBuyerCd(sortBuyerCd);
			int sortBname = Integer.valueOf((String) keywordObj.get("sortBname"));
			pricing.setSortBname(sortBname);
			int sortProductCd = Integer.valueOf((String) keywordObj.get("sortProductCd"));
			pricing.setSortProductCd(sortProductCd);
			int sortPname = Integer.valueOf((String) keywordObj.get("sortPname"));
			pricing.setSortPname(sortPname);
			int sortPrice = Integer.valueOf((String) keywordObj.get("sortPrice"));
			pricing.setSortPrice(sortPrice);
			int sortStartDate = Integer.valueOf((String) keywordObj.get("sortStartDate"));
			pricing.setSortStartDate(sortStartDate);
			int sortEndDate = Integer.valueOf((String) keywordObj.get("sortEndDate"));
			pricing.setSortEndDate(sortEndDate);
			int sortDiscount = Integer.valueOf((String) keywordObj.get("sortDiscount"));
			pricing.setSortDiscount(sortDiscount);
			int sortFinalPrice = Integer.valueOf((String) keywordObj.get("sortFinalPrice"));
			pricing.setSortFinalPrice(sortFinalPrice);
			int sortAddDate = Integer.valueOf((String) keywordObj.get("sortAddDate"));
			pricing.setSortAddDate(sortAddDate);
			int sortStateDate = Integer.valueOf((String) keywordObj.get("sortStateDate"));
			pricing.setSortStateDate(sortStateDate);
			
			int rowPerPage = Integer.valueOf((String) keywordObj.get("rowPerPage"));
			int currentPage = Integer.valueOf((String) keywordObj.get("currentPage"));
			int total = prs.getTotal(pricing);
			
			pricing.pagingBean(currentPage, rowPerPage, total);
			
			int startRow = (currentPage - 1) * rowPerPage + 1;
			int endRow = startRow + rowPerPage - 1;
			pricing.setStartRow(startRow);
			pricing.setEndRow(endRow);
			
			List<Pricing> searchList = prs.search(pricing);
			List<Buyer> buyerList = bs.ndlist();
			List<Product> productList = pds.allList();
			
			for (Pricing pricing1 : searchList) {
				pricing1.setFinalPrice(pricing1.getPrice() * (1 - ((double)pricing1.getDiscount()/100)));
			}
			
			model.addAttribute("pricingList", searchList);
			model.addAttribute("buyerList", buyerList);
			model.addAttribute("productList", productList);
		}catch (ParseException e) {
			System.out.println(e.getMessage());
		}
		return "nolay/pricingList";
	}

	@RequestMapping("pricingDelete")
	@ResponseBody
	public int pricingDelete(@RequestParam(name="checkRows")String[] arr, Pricing pricing) throws java.text.ParseException{
			
			int result = 0;
				for (String i : arr) {
					String[] a = i.split("&");
					String buyerCd = a[0];
					String productCd = a[1];
					
					Date startdate = Date.valueOf(a[2]);
					Date enddate = Date.valueOf(a[3]);
					
					pricing.setBuyerCd(buyerCd);
					pricing.setProductCd(productCd);
					pricing.setStartDate(startdate);
					pricing.setEndDate(enddate);
					
					prs.pricingDelete(pricing);
				}
			result = 1;
			return result;
	}
	
	@RequestMapping("pricingInsert")
	@ResponseBody
	public boolean pricingInsert(Model model, @RequestParam(name="items")String items) throws ParseException {
	
		boolean result = false;
		
		try {
			JSONParser p = new JSONParser();
			Object obj = p.parse(items);
			JSONArray arr = JSONArray.fromObject(obj);
			
			Pricing pricing = new Pricing(); 
						
			for (int i = 0; i < arr.size(); i++) {
				JSONObject itemObj = (JSONObject) arr.get(i);

				String buyerCd = (String) itemObj.get("buyerCd");
				String productCd = (String) itemObj.get("productCd");
				String rdate = (String) itemObj.get("startDate");
				Date startDate = Date.valueOf(rdate);
				rdate = (String) itemObj.get("endDate");
				Date endDate = Date.valueOf(rdate);
				int price = Integer.parseInt((String) itemObj.get("price"));
				int discount = Integer.parseInt((String) itemObj.get("discount"));
				
				pricing.setBuyerCd(buyerCd);
				pricing.setProductCd(productCd);
				pricing.setStartDate(startDate);
				pricing.setEndDate(endDate);
				pricing.setPrice(price);
				pricing.setDiscount(discount);
												
				prs.pricingInsert(pricing);
				
				result = true;
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			result = false;
		}
		
		return result;
	}
	

	@RequestMapping("pricingDetail")
	public String pricingDetail(Model model, Pricing pricing, String startDate) {
		pricing = prs.pricingDetail(startDate);
		
		model.addAttribute("pricing", pricing);
		
		return "nolay/pricingList";
	}
	
	@RequestMapping("overlapCheck")
	@ResponseBody
	public int overlapCheck(Pricing pricing) {
		int result = 0;
		result = prs.overlapCheck(pricing);

		return result;
	}
	@RequestMapping("pricingRestore")
	@ResponseBody
	public int pricingRestore(@RequestParam(name="checkRows")String[] arr, Pricing pricing) throws java.text.ParseException{
		
		int result = 0;
			for (String i : arr) {
				String[] a = i.split("&");
				String buyerCd = a[0];
				String productCd = a[1];
				
				Date startDate = Date.valueOf(a[2]);
				Date endDate = Date.valueOf(a[3]);
				
				pricing.setBuyerCd(buyerCd);
				pricing.setProductCd(productCd);
				pricing.setStartDate(startDate);
				pricing.setEndDate(endDate);
				
				prs.pricingRestore(pricing);
			}
		result = 1;
		return result;
	}
	
	@RequestMapping("pricingUpdate")
	@ResponseBody
	public int pricingUpdate(Pricing pricing) {
		int result = 0;
		System.out.println("buyerCd"+pricing.getBuyerCd());
		System.out.println("productCd"+pricing.getProductCd());
		System.out.println("pricing"+pricing.getPrice());
		System.out.println("startdate"+pricing.getStartDate());
		System.out.println("enddate"+pricing.getEndDate());
		System.out.println("discountrate"+pricing.getDiscount());
		result = prs.pricingUpdate(pricing);
		return result;
	}
	
//	@RequestMapping("getPrice")
//	@ResponseBody
//	public int getPrice(String buyerCd, String productCd) {
//		
//		Pricing pricing = new Pricing();
//		pricing.setBuyerCd(buyerCd);
//		pricing.setProductCd(productCd);
//				
//		int price = 0;
//		try {
//			price = prs.getPrice(pricing);
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//			price = -123;
//			
//		}
//		
//		return price;
//	}
	
	@RequestMapping("pricingExcelDown")
	@ResponseBody
	public void pricingExcelDown(HttpServletResponse response, @RequestParam(name="pricings")String pricings,Model model) throws IOException {
	//List<OrderHead> list = is.search(checkRow); List<OrderHead> checkRow,
	// 출력할 주문리스트
	List<Pricing> list = new ArrayList<Pricing>();
	
	Pricing pricingRow = new Pricing();

	try {
		JSONParser p = new JSONParser();
		Object obj = p.parse(pricings);
		JSONArray arr = JSONArray.fromObject(obj);
		
		Pricing pricing = new Pricing();
		
		for (int i = 0; i < arr.size(); i++) {
			
			JSONObject itemObj = (JSONObject) arr.get(i);
			String buyerCd = (String) itemObj.get("buyerCd");
			String productCd = (String) itemObj.get("productCd");
			
			String start = (String) itemObj.get("startDate");
			System.out.println("start:"+start);
			Date sdate = Date.valueOf(start);
			String end = (String) itemObj.get("endDate");
			Date edate = Date.valueOf(end);
			
			pricing.setBuyerCd(buyerCd);
			pricing.setProductCd(productCd);
			pricing.setStartDate(sdate);
			pricing.setEndDate(edate);
			
			pricingRow = prs.listForExcel(pricing);
			list.add(pricingRow);
			
			

		}
		
		
	} catch (ParseException e) {
		System.out.println(e.getMessage());
	}
	
	
	// 워크북 생성
	Workbook wb = new XSSFWorkbook();
	Sheet sheet = wb.createSheet("판매가 리스트");
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
    headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_40_PERCENT.getIndex());
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
    cell.setCellValue("고객코드");
    
    cell = row.createCell(1);
    cell.setCellStyle(headStyle);
    cell.setCellValue("고객명");
    
    cell = row.createCell(2);
    cell.setCellStyle(headStyle);
    cell.setCellValue("상품코드");
    
    cell = row.createCell(3);
    cell.setCellStyle(headStyle);
    cell.setCellValue("상품명");
    
    cell = row.createCell(4);
    cell.setCellStyle(headStyle);
    cell.setCellValue("판매가");
    
    cell = row.createCell(5);
    cell.setCellStyle(headStyle);
    cell.setCellValue("계약시작일");
    
    cell = row.createCell(6);
    cell.setCellStyle(headStyle);
    cell.setCellValue("계약종료일");

    cell = row.createCell(7);
    cell.setCellStyle(headStyle);
    cell.setCellValue("할인율");
    
    cell = row.createCell(8);
    cell.setCellStyle(headStyle);
    cell.setCellValue("최종판매가");
    
    cell = row.createCell(9);
    cell.setCellStyle(headStyle);
    cell.setCellValue("등록일");
    
    cell = row.createCell(10);
    cell.setCellStyle(headStyle);
    cell.setCellValue("상태변경일");
    
    
 // 데이터 부분 생성
    for(Pricing li : list) {
    	System.out.println(li);
    	
        row = sheet.createRow(rowNo++);
                
        cell = row.createCell(0);
        cell.setCellStyle(bodyStyle);
        cell.setCellValue(li.getBuyerCd());
        
        cell = row.createCell(1);
        cell.setCellStyle(bodyStyle);
        cell.setCellValue(li.getBname());

        cell = row.createCell(2);
        cell.setCellStyle(bodyStyle);
        cell.setCellValue(li.getProductCd());
        
        cell = row.createCell(3);
        cell.setCellStyle(bodyStyle);
        cell.setCellValue(li.getPname());
	    
	    cell = row.createCell(4);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue(li.getPrice());
	    
	    cell = row.createCell(5);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue(li.getStartDate().toString());
	    
	    cell = row.createCell(6);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue(li.getEndDate().toString());
	    
	    cell = row.createCell(7);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue(li.getDiscount());
	    
	    cell = row.createCell(8);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue(li.getPrice() * (1 - (li.getDiscount()/100)));
	    
	    cell = row.createCell(9);
	    cell.setCellStyle(bodyStyle);
	    cell.setCellValue(li.getAddDate().toString());
	    
	    cell = row.createCell(10);
	    cell.setCellStyle(bodyStyle);
	    if (li.getStateDate() != null) {
	    	cell.setCellValue(li.getStateDate().toString());
		}else {
			cell.setCellValue(li.getStateDate());
		}

    }

    // 컨텐츠 타입과 파일명 지정
	response.setContentType("ms-vnd/excel");
    response.setHeader("Content-Disposition", "attachment;filename=pricing.xlsx");
    
    // 엑셀 출력
    try {
        wb.write(response.getOutputStream());
    } finally {
        wb.close();
    }
 
	}

	
}
