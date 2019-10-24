package com.dd.devdeveloper.members.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.dd.devdeveloper.members.MembersVO;

public interface MembersService {
	//회원등록
	public void insertMembers(MembersVO vo);


	//로그인체크
	public boolean loginCheck(MembersVO vo, HttpSession session);
	
	//로그아웃
	public void logout(HttpSession session);
	
	
	/*
	 * //로그인 Map<String, Object> selectUserInfo(Map<String, Object> map) throws
	 * Exception;
	 */
}
