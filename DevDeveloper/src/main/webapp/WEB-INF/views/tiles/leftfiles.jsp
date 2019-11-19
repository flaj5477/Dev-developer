<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- Navigation -->
        <ul class="navbar-nav">
          <li class="nav-item">
          <a class=" nav-link" href="${pageContext.request.contextPath}/getDashboard" ><i class="ni ni-tv-2 text-primary"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
          <a class=" nav-link" href="getFilesList"> <i class="ni ni-folder-17 text-blue"></i> 파일
            </a>
          </li>
           <li class="nav-item">
          <a class=" nav-link" href="getProjCalendar"> <i class="far fa-calendar-alt text-purple"></i></i> 프로젝트 일정
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="getFilesImport">
              <i class="ni ni-favourite-28 text-red" ></i> 중요
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="getFilesTrash">
              <i class="material-icons">delete</i> 휴지통
            </a>
          </li>
          <!-- <li class="nav-item">
            <a class="nav-link " href="./wikihome">
              <i class="ni ni-single-02 text-yellow"></i> 위키가이드
            </a>
          </li> -->
         
        </ul>