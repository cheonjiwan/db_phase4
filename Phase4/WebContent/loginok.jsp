<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page session = "true" %>
<%@ page language="java" import="java.text.*,java.sql.*, java.util.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%
String id=request.getParameter("id");
String serverIP = "155.230.36.61";
String strSID = "orcl";
String portNum = "1521";
String user = "s2015113955";
String pass = "wan2good";
String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
System.out.println(url);
Connection conn = null;
PreparedStatement pstmt;
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url, user, pass);

String query = "select * from order_list where id='"+id+"'";
System.out.println(query);
pstmt = conn.prepareStatement(query);
rs = pstmt.executeQuery();

%>
<body>
	<h1>메인화면</h1>
   <input type="button" value="전체 차량 조회" onclick="location.href='all_car.jsp?id=<%=id%>'"/>
   <input type="button" value="차량 조건 검색" onclick="location.href='search.jsp?id=<%=id%>'"/>
   <input type="button" value="차량 이름 검색" onclick="location.href='name_search.jsp?id=<%=id%>'"/>
   <input type="button" value="회원 정보 수정" onclick="location.href='userform.jsp?id=<%=id%>'"/>
   <input type="button" value="거래 내역 조회" onclick="location.href='when_trade.jsp?id=<%=id%>'"/>
   <%if(!id.equals("admin"))
	 {
	    %>
		<input type="button" value="탈퇴" onclick="location.href='out.jsp?id=<%=id%>'"/>
		<%     
	 } %>
	 
	   
   
   <%if(id.equals("admin"))
   {
	   %>
	   <input type="button" value="관리자 기능" onclick="location.href='manager.jsp?id=<%=id%>'"/>
	   <%
   } %>
   <input type="button" value="로그 아웃" onclick="location.href='logout.jsp?id=<%=id%>'"/>
   <%
   if(!rs.next())
   {
	  %>
	   <input type="button" value="추천 상품 보기" onclick="location.href='best_car.jsp?id=<%=id%>'"/>
	  <%
   }
   
   
   %>
   
</body>
</html>