package com.dd.devdeveloper.qna.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.qna.AnswerVO;
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
		public String insertQnaPost(QuestionVO vo,HttpSession session) {	
			MembersVO membersNo = (MembersVO) session.getAttribute("members");
			vo.setMembersNo(membersNo.getMembersNo());
			qnaService.insertQna(vo);
			return "redirect:/qna";
		}
		
		//답변등록하기
		@RequestMapping(value ="/insertAnq", method=RequestMethod.POST)
		public String insertAnq(AnswerVO vo,HttpSession session,Model model) {	
			MembersVO membersNo = (MembersVO) session.getAttribute("members");
			vo.setMembersNo(membersNo.getMembersNo());

			qnaService.insertAnq(vo);
			return "redirect:/qnaNo?qNo="+vo.getqNo();
		}
		
		//상세보기
		@RequestMapping(value ="/qnaNo")
		public String getQna(QuestionVO vo,Model model, HttpSession session, AnswerVO avo) {
			qnaService.updateViews(vo.getqNo());
			 model.addAttribute("qna",qnaService.getQna(vo));
//			 session.setAttribute("title", vo.getqTitle());
			 avo.setqNo(vo.getqNo());
			 model.addAttribute("ans",qnaService.getAnq(avo));
			 System.out.println("dddddddddd"+qnaService.getAnq(avo));
			 
			return "qna/getQna";
		}
}
