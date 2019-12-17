<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
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
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	System.out.println(url);
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	
    String car_number = request.getParameter("car_number");
    String price = request.getParameter("price");
    String distance_driven = request.getParameter("distance_driven");
    String year = request.getParameter("year");
	String id=request.getParameter("id");
    
    System.out.println(": "+car_number);
    if(car_number.equals(" ")||price.equals(" ")||distance_driven.equals(" ")||year.equals(" "))
	{
		out.println("<form action=\"insert_vehicle.jsp\" method=\"post\">");		
		%><center>
		<br />
		모든 정보를 입력하세요
			<input type="hidden" name="id" value=<%=id %>></input>
		
		<input type="submit" value="닫기">
		</center>
		<%
		out.println("</form>");
	}
    else
   		{
    
	    String query = "select * from vehicle where car_number="+car_number;
		System.out.println(query);
	
	    pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		
		if(rs.next())
		{
			out.println("<form action=\"insert_vehicle.jsp\" method=\"post\">");
			
			%><center>
			<br />
			중복된 차량번호 입니다.
				<input type="hidden" name="id" value=<%=id %>></input>
			
			<input type="submit" value="닫기">
			</center>
			<%
			out.println("</form>");
		}
		else
		{
			out.println("<form action=\"insert.jsp\" method=\"post\">");
			out.println("<input type=\"hidden\" name=\"car_number\" value="+car_number+">");
			out.println("<input type=\"hidden\" name=\"price\" value="+price+">");
			out.println("<input type=\"hidden\" name=\"distance_driven\" value="+distance_driven+">");
			out.println("<input type=\"hidden\" name=\"year\" value="+year+">");



			%><center>
			<br />
			확인되었습니다.
				<input type="hidden" name="id" value=<%=id %>></input>
			
			<input type="submit" value="닫기">
			</center>
			<%
			out.println("</form>");
		}
	
    }
    
    
    %>
	
	
	
	
</body>
</html>