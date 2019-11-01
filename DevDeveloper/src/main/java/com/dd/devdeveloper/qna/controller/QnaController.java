package com.dd.devdeveloper.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.qna.service.QnaService;

@Controller
public class QnaController {

		@Autowired QnaService qnaService;
		
		@RequestMapping("/homeQna")
		public String qnaList() {
			return "/qna/homeQna";
		}
}
