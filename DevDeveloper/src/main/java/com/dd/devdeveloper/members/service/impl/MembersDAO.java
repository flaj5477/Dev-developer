package com.dd.devdeveloper.members.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MembersDAO {

	 @Autowired SqlSessionTemplate mybatis;
}
