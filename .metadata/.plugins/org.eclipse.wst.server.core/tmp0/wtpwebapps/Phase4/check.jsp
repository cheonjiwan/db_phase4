<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
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
	
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    String query = "select * "+"from account where id='"+id+"' and password='"+pw+"'";
	System.out.println(query);
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	String temp;
    // 2: 사용자 인증
   
    if(rs.next())
   		temp = "loginok.jsp?error="+id; // 인증 성공
   	else
   		temp = "login.jsp?error=login-failed..";
	
    rs.close();
   	pstmt.close();
   	conn.close();
    response.sendRedirect(temp);
    %>
 
