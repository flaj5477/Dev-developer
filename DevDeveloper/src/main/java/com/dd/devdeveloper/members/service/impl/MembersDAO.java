package com.dd.devdeveloper.members.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.members.MembersVO;

@Repository
public class MembersDAO {

	 @Autowired SqlSessionTemplate mybatis;

	 public void insertMembers(MembersVO vo) {
		 mybatis.insert("MembersDAO.insertMembers",vo);
		
	}
}
