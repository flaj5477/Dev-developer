package com.dd.devdeveloper.members.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.members.service.MembersService;

@Service
public class MembersServiceImpl implements MembersService{

	 @Autowired MembersDAO membersDAO;
}
