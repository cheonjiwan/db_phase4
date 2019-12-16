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
		String m_name=request.getParameter("m_name");
		
		String car_number=request.getParameter("car_number");
		String query="";
		System.out.println(m_name);
		System.out.println("testtesttest");
		
		if(m_name==null||m_name.equals("null"))
			{
				query = "select model_name from model";
			}
		else
			query="select model_name from model where m_number=(select m_number from make where name='"+m_name.replace("/","")+"')";
		System.out.println(query);
		System.out.println(m_name);
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		%>
		
		<form action="search3.jsp" method="post">
		<%
		while(rs.next())
		{
			String name=rs.getString(1);
			%>
			<input type="hidden" name='id' value="<%=id%>">
		
			<input type="hidden" name='m_name' value="<%=m_name %>">
			<input type='radio' name='model_name' value="<%=name %>"/><%=name %>
			<%
		}
		
		%>
		<input type="submit" value="next">
	</form>
	