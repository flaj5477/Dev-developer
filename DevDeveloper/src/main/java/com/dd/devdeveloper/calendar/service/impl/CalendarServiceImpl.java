package com.dd.devdeveloper.calendar.service.impl;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dd.devdeveloper.calendar.ProjCalendarVO;
import com.dd.devdeveloper.calendar.service.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired ProjCalendarDAO projCalendarDAO ;
	
	@Override
	public List<ProjCalendarVO> uploadExcelFile(MultipartFile excelFile) {

		List<ProjCalendarVO> list = new ArrayList<ProjCalendarVO>();

		try {
			OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);

			// 첫번째 시트 불러오기
			XSSFSheet sheet = workbook.getSheetAt(0);

			// 한줄씩 반복문
			for (int i = 1; i < sheet.getLastRowNum() + 1; ++i) {  //두번째 줄부터 읽기
				XSSFRow row = sheet.getRow(i);

				// 행이 존재하기 않으면 패스
				if (row == null) {
					continue;
				}

				ProjCalendarVO vo = new ProjCalendarVO(); // 엑셀 한줄을 저장할 객체

				// 엑셀 파일의 각각의 값 읽어 오기
				for (int j = 0; j < row.getLastCellNum(); ++j) {
					XSSFCell cell = row.getCell(j); // 셀 불러오기
					if (cell != null) {
						switch (j) {
						case 0:
							vo.setTaskTitle(cell.getStringCellValue());
							break;
						case 1:
							vo.setProjNo(((int) cell.getNumericCellValue()));
							break;
						case 2:
							// 자바 util->sql
							Date StartDate = new Date(cell.getDateCellValue().getTime());
							vo.setStartDate(StartDate);
							break;
						case 3:
							Date EndDate = new Date(cell.getDateCellValue().getTime());
							vo.setEndDate(EndDate);
							break;
						case 4:
							vo.setDeveloperNo(((int) cell.getNumericCellValue()));
							break;
						case 5:
							vo.setTaskComplete(cell.getStringCellValue());
							break;
						}
					}
				}
				System.out.println( "셀 출력: " + vo);
				
				// DB에 insert 하는 부분
				projCalendarDAO.insertProjCalendar(vo);
				
				list.add(vo);  //리스트에 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return list;
	}

	@Override
	public List<ProjCalendarVO> getProjCalendarData(ProjCalendarVO vo) { //DB데이터 조회
		return projCalendarDAO.getProjCalendarData(vo);
	}
}
