package com.dd.devdeveloper.qna.controller;

 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
import org.springframework.web.bind.annotation.ResponseBody;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.projects.ProjectsVO;
import com.dd.devdeveloper.qna.AnswerVO;
import com.dd.devdeveloper.qna.QuestionVO;
import com.dd.devdeveloper.qna.RecListVO;
import com.dd.devdeveloper.qna.service.QnaService;
import com.dd.devdeveloper.tags.service.TagsService;


@Controller
public class QnaController {

		@Autowired QnaService qnaService;
		@Autowired TagsService tagsService;
		
		//qna목록
		@RequestMapping("/qna")
		public String qnaList(Model model, QuestionVO vo, Paging paging) {
			List<QuestionVO> qnaList = qnaService.qnaList(vo, paging);
			 
			
			for(int i=0;i<qnaList.size();i++) {
				String tags = qnaList.get(i).getqTags(); //스트링으로 연결되어있는 tags를
				QuestionVO qvo = qnaList.get(i);
				qvo.setDivTagList(tagsService.divTag(tags)); //잘라서 list 형식으로 넣어줌
				qnaList.set(i, qvo);             // 동우 화정 꺼 참고
			}
			
			
			
			model.addAttribute("qnaList", qnaList);
			model.addAttribute("paging", paging);
			return "qna/homeQna";
		}
		
		//등록폼
		@RequestMapping(value ="/insertQna", method=RequestMethod.GET)
		public String insertQnaGet(Model model) {
			model.addAttribute("tagList", tagsService.getTagList());
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
			model.addAttribute("tagList", tagsService.getTagList());
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
			 vo.setqLikeCount(qnaService.countRec(vo.getqNo()));
			 model.addAttribute("qna",qnaService.getQna(vo));
//			 session.setAttribute("title", vo.getqTitle());
			 avo.setqNo(vo.getqNo());
			 List<AnswerVO> voo = qnaService.getAnq(avo);
			 model.addAttribute("anslist",voo);
		
			return "qna/getQna";
		}
		
		//좋아요
		 @ResponseBody
		 @RequestMapping(value="/recUpdate", method=RequestMethod.POST)
		  public Map<String, Object> like(RecListVO vo, HttpSession session){
			 MembersVO membersNo = (MembersVO) session.getAttribute("members");
			 vo.setMembersNo(membersNo.getMembersNo());

		
			 int result = qnaService.readRec(vo);
			 System.out.println("11111111111"+result);
			 int count = 0;
			 
			 if(result == 0) {
				 qnaService.insertRec(vo);
			 }else {
				 qnaService.deleteRec(vo);
			 }
			 System.out.println("asadasafsadsadsadsadasd"+ vo);
			 //조회수
			 if(vo.getQaType() == 1) {
				count = qnaService.countRec(vo.getQaNo());
			 }else
				count = qnaService.acountRec(vo.getQaNo());
			 
				
		 HashMap<String, Object> hm = new HashMap<String, Object>(); 
		 hm.put("result", result); 
		 hm.put("count", count);
			  
			 return hm; 
		 }
		 
		 
		 
 }

