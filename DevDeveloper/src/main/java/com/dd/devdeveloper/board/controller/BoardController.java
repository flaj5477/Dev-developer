package com.dd.devdeveloper.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.board.BoardVO;
import com.dd.devdeveloper.board.service.BoardService;


@Controller
public class BoardController {
	
	@Autowired BoardService boardService;
	
	//�떒嫄댁“�쉶
	@RequestMapping("/getBoard")
	public String getBoard(BoardVO vo, Model model) {
		model.addAttribute("board",boardService.getBoard(vo));

		return "board/getBoard";  //board�뤃�뜑 諛륁뿉 getBoard.jsp濡� 媛��씪!
	}
	
}
