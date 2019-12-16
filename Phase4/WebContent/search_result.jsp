<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<%@ page session = "true" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
h2{color:red;}
</style>
<meta charset="EUC-KR">
<title>검색 결과</title>
</head>
<body>
<h1>검색 결과</h1>

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
		String id,type,input;
        request.setCharacterEncoding("euc-kr");
        
        id = request.getParameter("id");
        type = request.getParameter("keyField");
        input = request.getParameter("keyWord");
        String query="";
        int flag=0;
        
        System.out.println(id);
        System.out.println(type);
        System.out.println(input);
        //out.println(type+input);
        
        if(type.equals("make"))
        {
        	query="select vehicle.car_number,vehicle.price,vehicle.year,vehicle.distance_driven,make.name,vehicle.model_name,vehicle.detail_model_name,category.c_name,engine_displacement.quantity,transmission.type\r\n" + 
                    "from vehicle,engine_displacement,make,category,transmission\r\n" + 
                    "where lower(make.name) like lower('"+input+"') and car_number not in( select car_number from order_list) \r\n" + 
                    "and vehicle.opendata=1 \r\n" + 
                    "and vehicle.quantity_num=engine_displacement.quantity_num \r\n" + 
                    "and vehicle.category_num=category.category_num \r\n" + 
                    "and vehicle.transmission_num=transmission.transmission_num \r\n" +
                    "and vehicle.m_number=make.m_number order by vehicle.car_number";
        }
        else if(type.equals("model_name"))
        {
        	query="select vehicle.car_number,vehicle.price,vehicle.year,vehicle.distance_driven,make.name,vehicle.model_name,vehicle.detail_model_name,category.c_name,engine_displacement.quantity,transmission.type\r\n" + 
                    "from vehicle,engine_displacement,make,category,transmission\r\n" + 
                    "where lower(vehicle.model_name) like lower('"+input+"') and car_number not in( select car_number from order_list) \r\n" + 
                    "and vehicle.opendata=1 \r\n" + 
                    "and vehicle.quantity_num=engine_displacement.quantity_num \r\n" + 
                    "and vehicle.category_num=category.category_num \r\n" + 
                    "and vehicle.transmission_num=transmission.transmission_num \r\n" +
                    "and vehicle.m_number=make.m_number order by vehicle.car_number";
        }
        else if(type.equals("detail_model_name"))
        {
        	query="select vehicle.car_number,vehicle.price,vehicle.year,vehicle.distance_driven,make.name,vehicle.model_name,vehicle.detail_model_name,category.c_name,engine_displacement.quantity,transmission.type\r\n" + 
                    "from vehicle,engine_displacement,make,category,transmission\r\n" + 
                    "where lower(vehicle.detail_model_name) like lower('"+input+"') and car_number not in( select car_number from order_list) \r\n" + 
                    "and vehicle.opendata=1 \r\n" + 
                    "and vehicle.quantity_num=engine_displacement.quantity_num \r\n" + 
                    "and vehicle.category_num=category.category_num \r\n" + 
                    "and vehicle.transmission_num=transmission.transmission_num \r\n" +
                    "and vehicle.m_number=make.m_number order by vehicle.car_number";	
        }
        
        try 
        {
            rs=stmt.executeQuery(query);
            if(rs.isBeforeFirst()==false)
            {
            	%>
            	<h2>검색 결과가 없습니다.</h2>
            	<%
            }else
            {
            	out.println("<table border=\"1\">");
                rsmd = rs.getMetaData();
                cnt = rsmd.getColumnCount();
                for(int i =1;i<=cnt;i++){
            		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
            	}
                while(rs.next()){
                    out.println("<tr>");
                    
                    flag=1;
                    out.println("<form action=\"detail_car.jsp\" method=\"post\">");
                    out.println("<input type=\"hidden\" name=\"id\" value="+id+">");
                    out.println("<td><input type=\"submit\" name=\"car_number\" value="+rs.getString(1)+"></td>");
                    out.println("<td>"+rs.getString(2)+"</td>");
                    out.println("<td>"+rs.getString(3)+"</td>");
                    out.println("<td>"+rs.getString(4)+"</td>");
                    out.println("<td>"+rs.getString(5)+"</td>");
                    out.println("<td>"+rs.getString(6)+"</td>");
                    out.println("<td>"+rs.getString(7)+"</td>");
                    out.println("<td>"+rs.getString(8)+"</td>");
                    out.println("<td>"+rs.getString(9)+"</td>");
                    out.println("<td>"+rs.getString(10)+"</td>");
                    out.println("</tr>");

                    }
            }
            
        } 
        catch (SQLException e1) 
        {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
%>

</body>
</html>