package com.dd.devdeveloper.qna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.qna.QuestionVO;
import com.dd.devdeveloper.qna.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired QnaDAO qnaDAO;

	//목록
	@Override
	public List<QuestionVO> qnaList(QuestionVO vo,Paging paging) {	
		
		//페이징 처리
				if (paging.getPage() == null) {
					paging.setPage(1);
				}
				paging.setPageUnit(8); // 게시글 몇개뿌릴지?
				paging.setPageSize(5); // 하단 페이지목록 개수

				// 전체 건수
				paging.setTotalRecord(qnaDAO.getCountQna(vo)); // 전체건수
					 
				// 시작/마지막 레코드 번호
				vo.setFirst(paging.getFirst());
				vo.setLast(paging.getLast());
				
				
		return qnaDAO.qnaList(vo);
	}

	//질문등록
	@Override
	public void insertQna(QuestionVO vo) {
			qnaDAO.insertQna(vo);
		
	}
	//상세보기
	@Override
	public QuestionVO getQna(QuestionVO vo) {
		
		return qnaDAO.getQna(vo);
	}

}
