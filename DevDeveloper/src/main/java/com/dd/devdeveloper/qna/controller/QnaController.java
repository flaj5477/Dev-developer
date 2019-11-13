package com.dd.devdeveloper.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.qna.QuestionVO;
import com.dd.devdeveloper.qna.service.QnaService;


@Controller
public class QnaController {

		@Autowired QnaService qnaService;
		
		//qna목록
		@RequestMapping("/qna")
		public String qnaList(Model model, QuestionVO vo, Paging paging) {
			model.addAttribute("qnaList", qnaService.qnaList(vo, paging));
			model.addAttribute("paging", paging);
			return "qna/homeQna";
		}
		
		//등록폼
		@RequestMapping(value ="/insertQna", method=RequestMethod.GET)
		public String insertQnaGet() {
			return "qna/insertQna";
		}
		
		//질문등록하기
		@RequestMapping(value ="/insertQna", method=RequestMethod.POST)
		public String insertQnaPost(QuestionVO vo) {
			System.out.println("-----------컨트롤러-----------");
			qnaService.insertQna(vo);
			return "redirect:/homeQna";
		}
}
