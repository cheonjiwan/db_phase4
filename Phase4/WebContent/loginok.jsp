<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page session = "true" %>
<%@ page language="java" import="java.text.*,java.sql.*, java.util.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%
String id=request.getParameter("id");
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

String query = "select * from order_list where id='"+id+"'";
System.out.println(query);
pstmt = conn.prepareStatement(query);
rs = pstmt.executeQuery();

%>
<body>
	<h1>����ȭ��</h1>
   <input type="button" value="��ü ���� ��ȸ" onclick="location.href='all_car.jsp?id=<%=id%>'"/>
   <input type="button" value="���� ���� �˻�" onclick="location.href='search.jsp?id=<%=id%>'"/>
   <input type="button" value="���� �̸� �˻�" onclick="location.href='name_search.jsp?id=<%=id%>'"/>
   <input type="button" value="ȸ�� ���� ����" onclick="location.href='userform.jsp?id=<%=id%>'"/>
   <input type="button" value="�ŷ� ���� ��ȸ" onclick="location.href='when_trade.jsp?id=<%=id%>'"/>
   <%if(!id.equals("admin"))
	 {
	    %>
		<input type="button" value="Ż��" onclick="location.href='out.jsp?id=<%=id%>'"/>
		<%     
	 } %>
	 
	   
   
   <%if(id.equals("admin"))
   {
	   %>
	   <input type="button" value="������ ���" onclick="location.href='manager.jsp?id=<%=id%>'"/>
	   <%
   } %>
   <input type="button" value="�α� �ƿ�" onclick="location.href='logout.jsp?id=<%=id%>'"/>
   <%
   if(!rs.next())
   {
	  %>
	   <input type="button" value="��õ ��ǰ ����" onclick="location.href='best_car.jsp?id=<%=id%>'"/>
	  <%
   }
   
   
   %>
   
</body>
</html>