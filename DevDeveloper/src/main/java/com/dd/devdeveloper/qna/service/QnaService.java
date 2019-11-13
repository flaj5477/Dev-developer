package com.dd.devdeveloper.qna.service;

import java.util.List;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.qna.QuestionVO;

public interface QnaService {

	
	//목록
	List<QuestionVO> qnaList(QuestionVO vo, Paging paging);
	
	//질문등록
	void insertQna(QuestionVO vo);
	
	//상세보기
	QuestionVO getQna(QuestionVO vo);
	
}
