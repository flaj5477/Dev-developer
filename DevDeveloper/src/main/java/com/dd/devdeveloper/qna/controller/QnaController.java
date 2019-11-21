package com.dd.devdeveloper.qna.controller;

 
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
import org.springframework.web.bind.annotation.ResponseBody;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.qna.AnswerVO;
import com.dd.devdeveloper.qna.QuestionVO;
import com.dd.devdeveloper.qna.RecListVO;
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
		
		//질문수정폼
		@RequestMapping(value ="/updateQnaForm")
		public String updateQnaGet(QuestionVO vo, Model model) {
			
			model.addAttribute("qna",qnaService.getQna(vo));
	
			return "qna/updateQna";
		}
		
		//질문수정
		@RequestMapping(value ="/updateQna", method=RequestMethod.POST)
		public String updateQnaPost(QuestionVO vo) {
			qnaService.updateQna(vo);
			return "redirect:/qnaNo?qNo="+vo.getqNo();
		}
		
		//답변수정
		@RequestMapping(value ="/updateAnq", method=RequestMethod.GET)
		public String updateAnqGet(AnswerVO vo, Model model) {
	 
			qnaService.updateAnq(vo);
			return "redirect:/qnaNo?qNo="+vo.getqNo();
		}
		//답변수정
		@RequestMapping(value ="/updateAnq", method=RequestMethod.POST)
		public String updateAnq(AnswerVO vo, HttpSession session) {
		/*
		 * MembersVO membersNo = (MembersVO) session.getAttribute("members");
		 * vo.setMembersNo(membersNo.getMembersNo());
		 */
			System.out.println("9999999999999"+vo);
			qnaService.updateAnq(vo);
			return "redirect:/qnaNo?qNo="+vo.getqNo();
		}
		
		//질문삭제
		@RequestMapping(value ="/deleteQna", method=RequestMethod.GET)
		public String deleteQna(QuestionVO vo) {
			qnaService.deleteQna(vo);		
			return "redirect:/qna";
		}
		//답변 삭제
		@RequestMapping(value ="/deleteAnq", method=RequestMethod.GET)
		public String deleteAnq(AnswerVO vo ,QuestionVO voo) {	 
			qnaService.deleteAnq(vo); 
			return "redirect:/qnaNo?qNo="+vo.getqNo();
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
			 model.addAttribute("anslist",qnaService.getAnq(avo));
			 System.out.println("dddddddddd"+qnaService.getAnq(avo));
			 
			return "qna/getQna";
		}
		
		//좋아요
		 @ResponseBody
		 @RequestMapping(value="/recUpdate", method=RequestMethod.POST)
		  public String like(RecListVO vo, HttpSession session){
			 MembersVO membersNo = (MembersVO) session.getAttribute("members");
			 vo.setMembersNo(membersNo.getMembersNo());
			 
		/*
		 * HashMap<String, Object> hm = new HashMap<String, Object>(); hm.put("qaNo",
		 * vo.getQaNo()); hm.put("membersNo", vo.getMembersNo());
		 */
			 int result = qnaService.readRec(vo);
			 System.out.println("11111111111"+result);
			 
			 if(result == 0) {
				 qnaService.insertRec(vo);
			 }else {
				 qnaService.deleteRec(vo);
			 }
			 
			 
		return "" ;
		 }
}
