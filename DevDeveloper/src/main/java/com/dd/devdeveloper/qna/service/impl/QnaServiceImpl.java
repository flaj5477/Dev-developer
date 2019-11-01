package com.dd.devdeveloper.qna.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.qna.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired QnaDAO qnaDAO;

}
