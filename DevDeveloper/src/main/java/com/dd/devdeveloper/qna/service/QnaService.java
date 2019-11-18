package com.dd.devdeveloper.qna.service;

import java.util.List;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.qna.AnswerVO;
import com.dd.devdeveloper.qna.QuestionVO;

public interface QnaService {

	
	//목록
	List<QuestionVO> qnaList(QuestionVO vo, Paging paging);
	
	//질문등록
	void insertQna(QuestionVO vo);
	
	void updateQna(QuestionVO vo);
	
	void deleteQna(QuestionVO vo);
	
	void deleteAnq(AnswerVO vo);
	//답변등록
	void insertAnq(AnswerVO vo);
	void updateAnq(AnswerVO vo);
	List<AnswerVO> getAnq(AnswerVO vo);
	
	//상세보기
	QuestionVO getQna(QuestionVO vo);
	
	void updateViews(int qNo);
	
	
}
