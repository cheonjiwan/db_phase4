<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<%@ page session = "true" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	div{
		float:right;
		text-aligh:center;
	}
	
	.box1{background:red;}
	.box2{background:red;}
	.box3{background:red;}
</style>
</head>
<%
String id=request.getParameter("id");
%>
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
		ResultSetMetaData rsmd;
		int cnt;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,pass);
		Statement stmt = null;
		stmt = conn.createStatement();
		
        request.setCharacterEncoding("euc-kr");
        
        String query;
        
        if(id.equals("admin"))
        	query = "select to_char(when_to_trade,'yyyy-mm-dd'),order_list.id, order_list.car_number, model_name,detail_model_name from order_list,vehicle where id!='admin' and order_list.car_number=vehicle.car_number order by when_to_trade asc";
        else
        	query = "select to_char(when_to_trade,'yyyy-mm-dd'),order_list.id, order_list.car_number, model_name,detail_model_name from order_list,vehicle where id="+"'"+id+"'"+"and order_list.car_number=vehicle.car_number order by when_to_trade asc";
        
        
        try 
        {
            rs=stmt.executeQuery(query);
            out.println("<table border=\"1\">");
            rsmd = rs.getMetaData();
            cnt = rsmd.getColumnCount();
            
            out.println("<th>"+"�ŷ��Ͻ�"+"</th>");
            out.println("<th>"+"������ID"+"</th>");
            out.println("<th>"+"������ȣ"+"</th>");
            out.println("<th>"+"�𵨸�"+"</th>");
            out.println("<th>"+"���θ𵨸�"+"</th>");
            while(rs.next()){
                out.println("<tr>");
                out.println("<td>"+rs.getString(1)+"</td>");
                out.println("<td>"+rs.getString(2)+"</td>");
                out.println("<td>"+rs.getString(3)+"</td>");
                out.println("<td>"+rs.getString(4)+"</td>");
                out.println("<td>"+rs.getString(5)+"</td>");
                out.println("</tr>");

                }
        } 
        catch (SQLException e1) 
        {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
	 	
%>
<%
if(id.equals("admin"))
{
	%>
	<h1 aligh="left">�ŷ� ����</h1>
	<h2 align="right">������ ���</h1>
	<div class="box1">
		<input type="button" value="�����纰 �ŷ�����" onclick="location.href='by_make.jsp?id=<%=id%>'">
	</div>
	<div class="box2">
		<input type="button" value="������ �ŷ�����" onclick="location.href='by_year.jsp?id=<%=id%>'">
	</div>
	<div class="box3">
		<input type="button" value="���� �ŷ�����" onclick="location.href='by_month.jsp?id=<%=id%>'">
	</div>
	<%
}else
{
	%>	
	<h1 aligh="left">�ŷ� ����</h1>
	<%
} %>

<input type="button" value="��������" onclick="location.href='loginok.jsp?id=<%=id%>'"></input>
</body>
</html>