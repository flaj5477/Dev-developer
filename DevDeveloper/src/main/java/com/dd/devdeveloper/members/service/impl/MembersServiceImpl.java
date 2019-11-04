package com.dd.devdeveloper.members.service.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.members.service.MembersService;
import com.dd.devdeveloper.members.service.MembersSha256;

@Service
public class MembersServiceImpl implements MembersService{

	 @Autowired MembersDAO membersDAO;

	 @Override
		public void insertMembers(MembersVO vo) {
			 
			membersDAO.insertMembers(vo);
		}

	 @Override
		public int loginCheck(MembersVO vo, HttpSession session) {
		 	 
		// System.out.println("impl로 오는거 // 로그인 객체 확인 VO : " + vo);
			 String mid = vo.getMembersId();
			 String mpw = vo.getMembersPw();
			// System.out.println("=======22222222222========" + mpw); 
			 

			 MembersVO voo = membersDAO.getmembers(vo);
			// System.out.println("UserLoginService //  voo : " + voo);
			 
			 
			 int result = 0;
			 
			 if(voo == null) {
				 result = 0;
				 return result;
			 }
			 
			 if(voo.getMembersId().equals(mid)
					 && voo.getMembersPw().equals(mpw)) {
				 
				 
			 	session.setAttribute("members", voo);
			 		
			 	result = 1;

			 }
		
			return result;
		}

		

		@Override
		public void logout(HttpSession session) {
			session.invalidate();
			
		}

		@Override
		public MembersVO getmembers(MembersVO vo) {
			return membersDAO.getmembers(vo);
			 
		}
	 
}
	 
	 
	 
	 
	 
	/*
	 * @Override public Map<String, Object> selectUserInfo(Map<String, Object> map)
	 * throws Exception {
	 * 
	 * return membersDAO.selectUserInfo(map); }
	 */

	


 
		
	
 
