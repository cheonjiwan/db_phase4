<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java"
	import="java.text.*,java.sql.*, java.util.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
<% 
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
		String id=request.getParameter("id");
		String car_number=request.getParameter("car_number");
		  
	   String price = request.getParameter("price");
	   String distance_driven = request.getParameter("distance_driven");
	   String year = request.getParameter("year");

		String query = "select name from make";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		%>
		
		<form action="insert2.jsp" method="post">
		<%
		while(rs.next())
		{
			String name=rs.getString(1);
			%>
			<input type="hidden" name='id' value="<%=id%>">
			<input type="hidden" name='car_number' value="<%=car_number%>">
			<input type="hidden" name='price' value="<%=price%>">
			<input type="hidden" name='distance_driven' value="<%=distance_driven%>">
			<input type="hidden" name='year' value="<%=year%>">
			<input type='radio' name='m_name' value="<%=name %>"><%=name %>
			<%
		}
		
		%>
		<input type="submit" value="next">
	</form>
	
	  
</body>
</html>