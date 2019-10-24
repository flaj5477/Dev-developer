package com.dd.devdeveloper.members.service.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.members.MembersVO;

@Repository
public class MembersDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	public void insertMembers(MembersVO vo) {
		mybatis.insert("MembersDAO.insertMembers", vo);

	}

	/**/
	public boolean loginCheck(MembersVO vo) {
		String name = mybatis.selectOne("MembersDAO.loginCheck", vo);

		// 검색이 안되면 0을 반환해주기 때문에 0과 비교해서 참이면 false, 틀리면 true를 반환
		return (Integer.parseInt(name) == 0) ? false : true;
	}

	public void logout(HttpSession session) {
		session.invalidate();

	}

	/*
	 * * @SuppressWarnings("unchecked") public Map<String, Object>
	 * selectUserInfo(Map<String, Object> map) throws Exception { return
	 * (Map<String, Object>)selectOne("MembersDAO.selectUserInfo", map); }
	 */

}
