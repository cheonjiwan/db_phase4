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
</head>

<body>
<h2>제조사별 거래내역</h2>
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
		ResultSetMetaData rsmd;
		int cnt;
		String id=request.getParameter("id");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,pass);
		stmt = conn.createStatement();
		
        request.setCharacterEncoding("euc-kr");
        
        String query;
        
        query="select make.name,sum(price)\r\n" + 
                "from order_list,vehicle,make\r\n" + 
                "where id='admin' and order_list.car_number=vehicle.car_number and vehicle.m_number=make.m_number\r\n" + 
                "group by make.name";
        
        try 
        {
            rs=stmt.executeQuery(query);
            out.println("<table border=\"1\">");
            rsmd = rs.getMetaData();
            cnt = rsmd.getColumnCount();
            out.println("<th>"+"제조사명"+"</th>");
            out.println("<th>"+"가격 총 합"+"</th>");
            while(rs.next()){
                out.println("<tr>");
                out.println("<td>"+rs.getString(1)+"</td>");
                out.println("<td>"+rs.getString(2)+"</td>");
                
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
        
 %>
</body>
<body>

        	<input type="button" value="메인으로 돌아가기" onclick="location.href='loginok.jsp?id=<%=id%>'"/>

</body>

	
					
</html>