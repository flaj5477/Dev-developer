package com.dd.devdeveloper.qna.service;

import java.util.List;


import com.dd.devdeveloper.qna.QuestionVO;

public interface QnaService {

	
	//목록
	List<QuestionVO> qnaList(QuestionVO vo);
	
}
