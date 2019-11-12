package com.dd.devdeveloper.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dd.devdeveloper.members.MembersVO;
  
public class LoginInterceptor extends HandlerInterceptorAdapter{
 
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        MembersVO user = (MembersVO) session.getAttribute("members");
 
        if(user == null){
        	session.setAttribute("prepage", request.getRequestURI());
        	
        	System.out.println("========uri=================" + request.getRequestURI());
            response.sendRedirect(request.getSession().getServletContext().getContextPath()+"/login"); // 절대경로지정
            return false;
        }
        return true;
    }
 
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
        super.postHandle(request, response, handler, modelAndView);
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub
        super.afterCompletion(request, response, handler, ex);
    }
}