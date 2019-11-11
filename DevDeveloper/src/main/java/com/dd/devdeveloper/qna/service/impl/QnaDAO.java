package com.dd.devdeveloper.qna.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.projects.ProjectsVO;
import com.dd.devdeveloper.qna.QuestionVO;

@Repository
public class QnaDAO {

		@Autowired SqlSessionTemplate mybatis;

		public List<QuestionVO> qnaList(QuestionVO vo) {
			
			return mybatis.selectList("QnaDAO.qnaList",vo);
		}

		
		
		public void insertQna(QuestionVO vo) {
			mybatis.insert("QnaDAO.insertQna", vo);
			
		}
		
		//전체 갯수 가져오기
		public int getCountQna(QuestionVO vo) {
			return mybatis.selectOne("QnaDAO.getCountQna", vo);
		}
		
}
