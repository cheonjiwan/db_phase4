<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그아웃 처리</title>
</head>
<body>
<% 
	session.invalidate();
	response.sendRedirect("firstpage.html");
%>
	
</body>
</html>