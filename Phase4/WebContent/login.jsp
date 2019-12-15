<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 

   if (request.getParameter("error") == null) { %>
    <h1>Please Login..</h1> 
<% } else { %>
    <h1><%= request.getParameter("error") %></h1>
<% } %>
	<form action="./check.jsp" method="post">
    <label>ID :</label>
    <input name="id" type="text"><br>
    <label>PW: </label>
    <input name="pw" type="password"><br>
    <input type="submit" value="로그인">
	</form>
</body>
</html>