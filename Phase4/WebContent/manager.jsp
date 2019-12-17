<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>매뉘저</title>
</head>
<%
String id = request.getParameter("id");
%>
<body>
<h1>관리자 기능 화면입니다.</h1>
   <input type="button" value="차량 매물 등록" onclick="location.href='insert_vehicle.jsp?id=<%=id%>'"/>
   <input type="button" value="차량 정보 수정" onclick="location.href='vehicle_update.jsp?id=<%=id%>'"/>
   <input type="button" value="차량 공개여부 설정" onclick="location.href='openmind.jsp?id=<%=id%>'"/>
</body>
</html>