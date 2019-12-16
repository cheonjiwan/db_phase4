<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java"
	import="java.text.*,java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

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
		java.util.Date time= new java.util.Date();
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String id=request.getParameter("id");
		String car_number=request.getParameter("car_number");
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");
		String today=format.format(time);
		out.println(id+car_number);
		String sql ="insert into order_list values('"+id+"',"+car_number+",to_date('"+today+"','yyyy-mm-dd'))";
		pstmt = conn.prepareStatement(sql);
		int res=pstmt.executeUpdate();
		sql="insert into order_list values('admin',"+car_number+",to_date('"+today+"','yyyy-mm-dd'))";
		pstmt = conn.prepareStatement(sql);
		res=pstmt.executeUpdate();
		if(res!=0)
			{
			%>
			구매완료 되었습니다
   			<input type="button" value="메인으로 돌아가기" onclick="location.href='loginok.jsp?id=<%=id%>'"/>
					<%
			conn.commit();}
			
		%>
<body>

</body>
</html>