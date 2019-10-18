package com.dd.devdeveloper.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.board.BoardVO;
import com.dd.devdeveloper.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired BoardDAOMybatis boardDAOMybatis;
	
	@Override
	public void insertBoard(BoardVO vo) {
		//�꽌鍮꾩뒪 硫붿꽌�뱶 �떒�쐞濡� �듃�옖�옲�뀡 諛쒖깮
		//conn
		
		//boardDAO.insertBoard(vo);
		boardDAOMybatis.insertBoard(vo);
		
		
		//commit
	}
	@Override
	public void deleteBoard(BoardVO vo) {
		
	}
	@Override
	public void updateBoard(BoardVO vo) {
		
	}
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAOMybatis.getBoard(vo);
	}
	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAOMybatis.getBoardList();
	}
	
}
