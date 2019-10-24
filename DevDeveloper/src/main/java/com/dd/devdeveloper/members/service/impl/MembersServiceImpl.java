package com.dd.devdeveloper.members.service.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.members.service.MembersService;

@Service
public class MembersServiceImpl implements MembersService{

	 @Autowired MembersDAO membersDAO;

	 @Override
		public void insertMembers(MembersVO vo) {
			 
			membersDAO.insertMembers(vo);
		}

	 @Override
		public boolean loginCheck(MembersVO vo, HttpSession session) {
			 
		 boolean result = membersDAO.loginCheck(vo);
			if (result == true) {	//true 일경우 세션 등록
				//세션 변수 등록
				session.setAttribute("membersId",vo.getMembersId());
				session.setAttribute("membersGrade", vo.getMembersGrade());
			}
			
			return result;
		}

		

		@Override
		public void logout(HttpSession session) {
			membersDAO.logout(session);
			
		}
	 
}
	 
	 
	 
	 
	 
	/*
	 * @Override public Map<String, Object> selectUserInfo(Map<String, Object> map)
	 * throws Exception {
	 * 
	 * return membersDAO.selectUserInfo(map); }
	 */

	


 
		
	
 
