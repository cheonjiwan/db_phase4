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
		
		String car_number=" ";
		String price=" ";
		String year=" ";
		String distance_driven=" ";
		%>
		
		<form action="insert_numcheck.jsp" method="post">
			���� ��ȣ<input type="text" name="car_number" value="<%=car_number %>"></input>	
			<br>
			���� ����<input type="text" name="price" value="<%=price %>"></input>
			<br>
			���� ����<input type="text" name="year" value="<%=year %>"></input>
			<br>
			���� �Ÿ�<input type="text" name="distance_driven" value="<%=distance_driven %>"></input>
				<input type="hidden" name="id" value=<%=id %>></input>
			
			<input type="submit" value="next"></input>
		</form>
		
		
		
		
</body>
</html>