package com.dd.devdeveloper.board.service;

import java.util.List;

import com.dd.devdeveloper.board.BoardVO;

public interface BoardService {
		//寃뚯떆湲� �벑濡�
		void insertBoard(BoardVO vo);
		
		//�궘�젣
		void deleteBoard(BoardVO vo);
		
		//�닔�젙
		void updateBoard(BoardVO vo);
		
		//�긽�꽭議고쉶
		BoardVO getBoard(BoardVO vo);
		
		//紐⑸줉議고쉶
		List<BoardVO> getBoardList(BoardVO vo);
		
}
