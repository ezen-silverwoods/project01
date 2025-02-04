<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 한글을 받기 위해 인코딩 설정
	request.setCharacterEncoding("UTF-8");
	
	String uid = request.getParameter("uid");
	// 파라메타로 넘어온 값의 유효성 검사
	if( uid == null || uid.equals("") ){
		out.print("ERROR");
		return;
	}
	// DBMS에서 id로 검색하여 중복 여부 판단
	// select count(*) as cnt from user where uid = '입력된아이디';
	// cnt -> 0 가입된 아이디 없음
	// cnt -> 1 가입된 아이디 있음
	if( uid.equals("ezen") ){
		out.print("DUPLE");
	}else{
		out.print("OK");
	}
%>
