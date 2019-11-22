package com.dd.devdeveloper.calendar.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.xml.ws.soap.AddressingFeature.Responses;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dd.devdeveloper.calendar.ProjCalendarVO;
import com.dd.devdeveloper.calendar.service.CalendarService;

@Controller
public class CalendarController {

	@Autowired CalendarService calendarService;
	
	//캘린더 홈 화면 출력
	@RequestMapping("/getProjCalendar")
	public String getProjCalendar() {
		
		return "files/calendar"; //캘린더 페이지로 이동
	}
	
	//캘린더 데이터 조회
	@RequestMapping(value="/getProjCalendarData", method=RequestMethod.GET)
	@ResponseBody
	public List<ProjCalendarVO> getProjCalendarData(ProjCalendarVO vo){
		List<ProjCalendarVO> list = calendarService.getProjCalendarData(vo);
		System.out.println("캘린더 조회 결과:::::::::::::::::::::::::::::::" + list);
		return list;
	}
	
	//하루 할일 조회
	@RequestMapping(value="/getToDoList", method=RequestMethod.GET)
	@ResponseBody
	public List<ProjCalendarVO> getToDoList(ProjCalendarVO vo){
		List<ProjCalendarVO> list = calendarService.getToDoList(vo);
		System.out.println("할일 조회 컨트롤러+++++++++++++" + list);
		return list;
	}
	
	//할일 수정
	@RequestMapping(value="/updateToDoList", method=RequestMethod.PUT, consumes = "application/json")
	@ResponseBody
	public Map updateToDoList(@RequestBody List<ProjCalendarVO> list) {
		System.out.println("할일수정 컨드롤러 진입!!!!!!!!!!!!!!!!!!");
		
		int success = 0;
		
		for(int i=0;i<list.size();i++) {
			success  += calendarService.updateToDoList(list.get(i)); //성공한 갯수 카운트
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("total", list.size());
		map.put("success", success);
		return map;
	}

	// 엑셀 업로드 폼
	/*
	 * @RequestMapping(value = "/excelUploadForm", method = RequestMethod.GET)
	 * public String ExcelForm() { return "manager/manager/managerExcelUpload"; }
	 */

	//엑셀 업로드 처리
	@RequestMapping(value = "excelUpload", method = RequestMethod.POST)
	public String ExcelUplod(ProjCalendarVO vo, MultipartHttpServletRequest request, Model model) {

		MultipartFile file = null;
		Iterator<String> iterator = request.getFileNames();
		if (iterator.hasNext()) {
			file = request.getFile(iterator.next());
		}
		//System.out.println("컨트롤러로 프로젝트 번호 잘 넘어오는지 확인" + vo.getProjNo());
		List<ProjCalendarVO> list = calendarService.uploadExcelFile(file, vo.getProjNo());

		/*
		 * for (ProjCalendarVO vo : list) { if (vo == null) { continue; }
		 * 
		 * if (vo.getTaskNo() == 0) { continue; }
		 * 
		 * try { //DB에 엑셀 입력하는 부분 insert } catch (Exception e) { continue; } }
		 */

		return "redirect:/getProjCalendar";
	}

}
