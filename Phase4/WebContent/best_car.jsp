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
<h1> 최고 매출 모델 </h1>
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

String query = "select * from(select model_name from vehicle where car_number in(select car_number from order_list) group by model_name order by count(*) desc) where rownum<=3";
pstmt = conn.prepareStatement(query);
rs = pstmt.executeQuery();

 while(rs.next())
 {
	 out.println("<h2>");
	 out.println(rs.getString(1));
	 out.println("</h2>");
	 out.println("<br>");
	 
 }
%>
<body>
        	<input type="button" value="메인으로 돌아가기" onclick="location.href='loginok.jsp?id=<%=id%>'"/>

</body>
</html>