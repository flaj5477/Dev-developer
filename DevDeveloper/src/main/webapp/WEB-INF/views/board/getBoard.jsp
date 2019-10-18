<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>게시글 보기</h3>
<h2>
	번호: ${board.seq } <br>
	제목: ${board.title }<br>
	글쓴이: ${board.writer }<br>
	내용: ${board.content }<br>
	카운트: ${board.cnt }<br>
</h2>