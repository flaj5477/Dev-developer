<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- Navigation -->
         <ul class="navbar-nav" >
          <li class="nav-item">
          <a class=" nav-link" href="${pageContext.request.contextPath}/getDashboard" > <i class="ni ni-tv-2 text-primary"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/qna">
              <i class="ni ni-planet text-blue"></i> Q & A
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/getProjectsList">
              <i class="ni ni-pin-3 text-orange"></i> 프로젝트공고
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/wikihome">
              <i class="ni ni-single-02 text-yellow"></i> 위키가이드
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="#" onclick="checkStorage()">
              <i class="ni ni-bullet-list-67 text-red"></i> CBT
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/tagList">
              <i class="ni ni-key-25 text-info"></i> Tags
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/logout">
              <i class="ni ni-circle-08 text-pink"></i> 임시로그아웃
            </a>
          </li>
        </ul>