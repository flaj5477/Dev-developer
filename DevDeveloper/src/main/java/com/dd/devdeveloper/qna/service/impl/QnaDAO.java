package com.dd.devdeveloper.qna.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.projects.ProjectsVO;
import com.dd.devdeveloper.qna.AnswerVO;
import com.dd.devdeveloper.qna.QuestionVO;

@Repository
public class QnaDAO {

		@Autowired SqlSessionTemplate mybatis;

		public List<QuestionVO> qnaList(QuestionVO vo) {
			
			return mybatis.selectList("QnaDAO.qnaList",vo);
		}

		
		//질문등록하기
		public void insertQna(QuestionVO vo) {
			mybatis.insert("QnaDAO.insertQna", vo);
			
		}
		
		//답변등록하기
		public void insertAnq(AnswerVO vo) {
			mybatis.insert("QnaDAO.insertAnq" , vo);
			
		}
		//답변리스트
		public List<AnswerVO> getAnq(AnswerVO vo) {
			return mybatis.selectList("QnaDAO.getAnq",vo);
		}
		
		//전체 갯수 가져오기
		public int getCountQna(QuestionVO vo) {
			return mybatis.selectOne("QnaDAO.getCountQna", vo);
		}


		//상세보기
		public QuestionVO getQna(QuestionVO vo) {
			return mybatis.selectOne("QnaDAO.getQna",vo);
		}



		public void updateViews(int qNo) {
			 mybatis.update("QnaDAO.updateViews",qNo);
			
		}


		public void updateQna(QuestionVO vo) {
			mybatis.update("QnaDAO.updateQna",vo);
			
		}


		public void deleteQna(QuestionVO vo) {
		     mybatis.delete("QnaDAO.deleteQna", vo);
			
		}


		public void deleteAnq(AnswerVO vo) {
			mybatis.delete("QnaDAO.deleteAnq",vo);
			
		}


		public void updateAnq(AnswerVO vo) {
			mybatis.update("QnaDAO.updateAnq",vo);
			
		}




		
}
