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
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,pass);
		stmt = conn.createStatement();
		String id=request.getParameter("id");
		
        request.setCharacterEncoding("euc-kr");
        
        String query;
        
        query="select to_char(when_to_trade,'yyyy') as year ,sum(price) from order_list,vehicle where id='admin' and order_list.car_number=vehicle.car_number group by to_char(when_to_trade,'yyyy') order by year";
        
        try 
        {
            rs=stmt.executeQuery(query);
            out.println("<table border=\"1\">");
            rsmd = rs.getMetaData();
            cnt = rsmd.getColumnCount();
            out.println("<th>"+"연도별"+"</th>");
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
</body>

	<h2>연도별 거래내역</h2>
    <input type="button" value="메인으로 돌아가기" onclick="location.href='loginok.jsp?id=<%=id%>'"/>

</html>