package com.dd.devdeveloper.board.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.board.BoardVO;

@Repository
public class BoardDAOMybatis {    //(p.513)
	
	@Autowired SqlSessionTemplate mybatis;
	
	//�벑濡�
	public void insertBoard(BoardVO vo) {
		System.out.println("mybatis insertBoard() �떎�뻾!!" );
					  //�뼺boardMapper�쓽 (mapper namespace媛�).(id媛�)
		mybatis.insert("BoardDAO.insertBoard",vo);
	}
	//�떒嫄댁“�쉶
	public BoardVO getBoard(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.getBoard",vo);
	}
	//�쟾泥댁“�쉶
	public List<BoardVO> getBoardList() {
		return mybatis.selectList("BoardDAO.getBoardList");
	}
}
