<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java"
	import="java.text.*,java.sql.*, java.util.*,java.util.ArrayList"%>
<%@ page session = "true" %>
<%@ page import="java.util.*" %>
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

		
		String car_number=request.getParameter("car_number");
		 String price = request.getParameter("price");
		   String distance_driven = request.getParameter("distance_driven");
		   String year = request.getParameter("year");
		String query="";
		System.out.println(m_name);
		System.out.println("testtesttest");
		
		if((m_name.equals("null")||m_name==null)||(model_name==null||model_name.equals("null")))
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
					<input type="submit" value="닫기">
						<input type="hidden" name="id" value=<%=id %>></input>
					
				</center>
			</form>
			
			<% 
			}
		else if(model_name!=null)//make입력시
		{	query="select detail_model_name from detail_model where model_name='"+model_name.replace("/","")+"'";
		
	
				System.out.println(query);
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				%>
				
				<form action="insert4.jsp" method="post">
				<%
				while(rs.next())
				{
					String name=rs.getString(1);
					%>
					<input type="hidden" name='id' value="<%=id%>">
					
					<input type="hidden" name='m_name' value="<%=m_name %>">
					<input type="hidden" name='model_name' value="<%=model_name %>">
					<input type='radio' name='detail_model_name' value="<%=name %>"/><%=name %>
					<input type="hidden" name='car_number' value="<%=car_number%>">
					<input type="hidden" name='price' value="<%=price%>">
					<input type="hidden" name='distance_driven' value="<%=distance_driven%>">
					<input type="hidden" name='year' value="<%=year%>">
					
					<%
				}
				
				%>
				<input type="submit" value="next">
				<% }%>
	</form>
	