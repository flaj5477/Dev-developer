package com.dd.devdeveloper.cbt.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CBTDAO {
	@Autowired
	SqlSessionTemplate cbtTemp;
	
}
