package com.dd.devdeveloper.members.service.impl;

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


 
		
	}
 
