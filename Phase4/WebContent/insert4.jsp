<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java"
	import="java.text.*,java.sql.*, java.util.*,java.util.ArrayList"%>
<%@ page session = "true" %>

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
		String model_name=request.getParameter("model_name");
		String detail_model_name=request.getParameter("detail_model_name");
		String car_number=request.getParameter("car_number");
		 String price = request.getParameter("price");
		   String distance_driven = request.getParameter("distance_driven");
		   String year = request.getParameter("year");
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+detail_model_name);
		String query="";
		
		if((m_name.equals("null")||m_name==null)||(detail_model_name==null||detail_model_name.equals("null")))
		{
		%>
		<form action="insert.jsp" method="post">
			<center>
				<br />
				모든 정보를 입력하세요
				<input type="hidden" name='car_number' value="<%=car_number%>">
					<input type="hidden" name='price' value="<%=price%>">
					<input type="hidden" name='distance_driven' value="<%=distance_driven%>">
					<input type="hidden" name='year' value="<%=year%>">
						<input type="hidden" name="id" value=<%=id %>></input>
					
				<input type="submit" value="닫기">
			</center>
		</form>
		
		<% 
		}
		else{
			query="select c_name from category";
	
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		%>
		
		<form action="insert_final.jsp" method="post">
		<%
		while(rs.next())
		{
			String name=rs.getString(1);
			%>
			<input type="hidden" name='id' value="<%=id%>">
			
			<input type="hidden" name='m_name' value="<%=m_name %>">
			<input type="hidden" name='model_name' value="<%=model_name %>">
			<input type="hidden" name='detail_model_name' value="<%=detail_model_name %>">
			<input type="hidden" name='car_number' value="<%=car_number%>">
			<input type="hidden" name='price' value="<%=price%>">
			<input type="hidden" name='distance_driven' value="<%=distance_driven%>">
			<input type="hidden" name='year' value="<%=year%>">
			<input type='radio' name='category' value="<%=name %>"/><%=name %>
			<%
		}
		out.println("<br>");
		out.println("<br>");
		query="select quantity from engine_displacement";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		while(rs.next())
		{
			String name=rs.getString(1);
			%>
			<input type='radio' name='quantity' value="<%=name %>"/><%=name %>
			<%
		}
		out.println("<br>");
		out.println("<br>");
		query="select type from transmission";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		while(rs.next())
		{
			String name=rs.getString(1);
			%>
			<input type='radio' name='transmission' value="<%=name %>"/><%=name %>
			<%
		}
		out.println("<br>");
		out.println("<br>");
		
		query="select type from color";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		while(rs.next())
		{
			String name=rs.getString(1);
			%>
			<input type='checkbox' name='color' value="<%=name %>"/><%=name %>
			<%
		}
		out.println("<br>");
		out.println("<br>");
		
		query="select type from fuel";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		while(rs.next())
		{
			String name=rs.getString(1);
			%>
			<input type='checkbox' name='fuel' value="<%=name %>"/><%=name %>
			<%
		}
		%>
		<input type="submit" value="next">
		<%} %>
	</form>
	