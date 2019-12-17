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
		String car_number=request.getParameter("car_number");
		
		
		String sql="select opendata from vehicle where car_number="+car_number;
		String opendata="";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next())
		{
			opendata=rs.getString(1);
		}
	try{	
		if(opendata.equals("1"))
		{
			sql="update vehicle set opendata=0 where car_number="+car_number;
			System.out.println(car_number);
			pstmt = conn.prepareStatement(sql);
			int res=pstmt.executeUpdate();
			if(res!=0)
			{
				System.out.println(sql);

				out.println("<h1> 비공개로 전환 완료</h1>");
				conn.commit();
				
			}
		}
		else
		{
			sql="update vehicle set opendata=1 where car_number="+car_number;
			
			pstmt = conn.prepareStatement(sql);
			int res=pstmt.executeUpdate();
			if(res!=0)
			{
				out.println("<h1> 공개로 전환 완료</h1>");
				conn.commit();
			}
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
		String admin="admin";
	%>
<body>
	<form action="loginok.jsp" method="post">
	<input type="hidden" name="id" value=<%=admin %>></input>
	<input type="submit" value="메인화면"></input>
	</form>
</body>
</html>