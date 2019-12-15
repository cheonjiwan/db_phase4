<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%
String id=request.getParameter("id");
%>
<body>
<h1> 메인</h1>
   <input type="button" value="전체 차량 조회" onclick="location.href='all_car.jsp?id=<%=id%>'"/>
   <input type="button" value="차량 조건 검색" onclick="location.href='search.jsp?id=<%=id%>'"/>
   <input type="button" value="차량 이름 검색" onclick="location.href='name_search?id=<%=id%>'"/>
   <input type="button" value="회원 정보 수정" onclick="location.href='modify?id=<%=id%>'"/>
   <input type="button" value="거래 내역 조회" onclick="location.href='when_trade.jsp?id=<%=id%>'"/>
   <input type="button" value="탈퇴" onclick="location.href='out.jsp?id=<%=id%>'"/>
   <input type="button" value="관리자 기능" onclick="location.href='manager.jsp?id=<%=id%>'"/>
   <input type="button" value="로그 아웃" onclick="location.href='logout.jsp?id=<%=id%>'"/>
   
   
</body>
</html>