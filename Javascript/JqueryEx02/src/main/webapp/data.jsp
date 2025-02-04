<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 한글을 받기 위해 인코딩 설정
	request.setCharacterEncoding("UTF-8");
	
	String uname = request.getParameter("uname");
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	// 파라메타로 넘어온 값의 유효성 검사
	if( uname == null || uname.equals("") )
	{
		uname = "데이터가 넘어오지 않았습니다";
		// 정상적인 요청이 아니므로 메인으로 쫓아보냄
		//response.sendRedirect("./index.jsp");
	}
	if( uid == null || uid.equals("") ){ uid = "None"; }
	if( upw == null || upw.equals("") ){ upw = "None"; }
	if( uid.equals("ezen") ) { uid = "중복 아이디 입니다"; }
%>
uname : <%= uname %>
uid : <%= uid %>
upw : <%= upw %>