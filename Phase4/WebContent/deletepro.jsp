<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ó��</title>
</head>
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
	Statement stmt = null;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	stmt = conn.createStatement();
	
	request.setCharacterEncoding("euc-kr");
	
	String id=request.getParameter("id");
	String pw = request.getParameter("password");
	int check=0;
	
	try
	{
		String query = "select password from account where id=?";
		String query2 = "delete from account where id=?";
		String dbpw="";
		
		pstmt=conn.prepareStatement(query);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			dbpw=rs.getString("password");
			if(dbpw.equals(pw))
			{
				pstmt = conn.prepareStatement(query2);
				pstmt.setString(1,id);
				pstmt.executeUpdate();
				conn.commit();
				check=1;
			}
		}
	}
	catch(Exception sqle)
	{
		try{
			conn.rollback();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}


%>
<body>
	<%
		if(check==1)
		{
			
			%>
			<br><br>
        <b><font size="4" color="gray">ȸ�������� �����Ǿ����ϴ�.</font></b>
        <br><br><br>
<% 
	session.invalidate();
%>
		<input type="button" value="Ȯ��" onclick="javascript:window.location='firstpage.html'">
<%
		}else{
%>
		<script>
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
		history.go(-1);</script>
<%
		}
	 %>	
</body>
</html>