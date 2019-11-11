package com.dd.devdeveloper.qna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dd.devdeveloper.qna.QuestionVO;
import com.dd.devdeveloper.qna.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired QnaDAO qnaDAO;

	//목록
	@Override
	public List<QuestionVO> qnaList(QuestionVO vo) {	
		return qnaDAO.qnaList(vo);
	}

	//질문등록
	@Override
	public void insertQna(QuestionVO vo) {
			qnaDAO.insertQna(vo);
		
	}

}
