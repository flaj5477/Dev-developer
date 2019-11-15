package com.dd.devdeveloper.common;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.logging.Level;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

import com.dd.devdeveloper.projects.ProjectsVO;

public class MyWebBindingInitializer implements WebBindingInitializer {
	public void initBinder(WebDataBinder binder, WebRequest request) {
		//데이터 포멧
		SimpleDateFormat format = new SimpleDateFormat("yyyy/mm/dd");
		binder.registerCustomEditor(ProjectsVO.class, new CustomDateEditor2(format, false));
	}
}