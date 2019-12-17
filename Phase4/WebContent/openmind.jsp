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
<h1>공개여부설정</h1>
</body>
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
		Statement stmt = null;
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		stmt = conn.createStatement();
		String id=request.getParameter("id");
		
		
		String sql="select vehicle.car_number,vehicle.price,vehicle.year,vehicle.distance_driven,make.name,vehicle.model_name,vehicle.detail_model_name,category.c_name,engine_displacement.quantity,transmission.type,vehicle.opendata\r\n" + 
				"from vehicle,engine_displacement,make,category,transmission\r\n" + 
				"where car_number not in(\r\n" + 
				"                        select car_number\r\n" + 
				"                        from order_list)\r\n" + 
				"      and vehicle.quantity_num=engine_displacement.quantity_num and vehicle.m_number=make.m_number and vehicle.category_num=category.category_num and vehicle.transmission_num=transmission.transmission_num\r\n";
				  
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		String temp;
	    // 2: 사용자 인증
	   
		    out.println("<table border=\"1\">");
			ResultSetMetaData rsmd = rs.getMetaData();
			int cnt = rsmd.getColumnCount();
			for(int i =1;i<=cnt;i++){
				out.println("<th>"+rsmd.getColumnName(i)+"</th>");
			}
	  	 while(rs.next()){
			out.println("<tr>");
			
			
			out.println("<form action=\"openmind_change.jsp\" method=\"post\">");
			out.println("<input type=\"hidden\" name=\"id\" value="+id+">");
			out.println("<td><input type=\"submit\" name=\"car_number\" value="+rs.getString(1)+"></td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<td>"+rs.getString(4)+"</td>");
			out.println("<td>"+rs.getString(5)+"</td>");
			out.println("<td>"+rs.getString(6)+"</td>");
			out.println("<td>"+rs.getString(7)+"</td>");
			out.println("<td>"+rs.getString(8)+"</td>");
			out.println("<td>"+rs.getString(9)+"</td>");
			out.println("<td>"+rs.getString(10)+"</td>");
			if(rs.getString(11).equals("1"))
				out.println("<td>"+"공개"+"</td>");
			else
				out.println("<td>"+"비공개"+"</td>");


			out.println("</tr>");

	  	 }
		
		
		%>
<body>
	<input type="button" value="메인으로" onclick="location.href='loginok.jsp?id=<%=id%>'"></input>
</body>
</html>