package com.dd.devdeveloper.members.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.dd.devdeveloper.members.MembersVO;

public interface MembersService {
	//회원등록
	public void insertMembers(MembersVO vo);


	//로그인체크
	public int loginCheck(MembersVO vo, HttpSession session);
	
	//로그아웃
	public void logout(HttpSession session);
	
	//아이디 검색
	public MembersVO getmembers(MembersVO vo);
	
 
}
