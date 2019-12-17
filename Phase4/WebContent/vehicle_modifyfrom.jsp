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
	
	request.setCharacterEncoding("euc-kr");
	
	String id = request.getParameter("id");
	String car_number = (String)session.getAttribute("car_number");
	String price = (String)session.getAttribute("price");
	String year = (String)session.getAttribute("year");
	String distance = (String)session.getAttribute("distance");
	String make = (String)session.getAttribute("make");
	String model = (String)session.getAttribute("model");
	String detail_model = (String)session.getAttribute("detail_model");
	String category = (String)session.getAttribute("category");
	String engine_displacement = (String)session.getAttribute("engine_displacement");
	String transmission= (String)session.getAttribute("transmission");
	String color = (String)session.getAttribute("color");
	String fuel = (String)session.getAttribute("fuel");
	
%>

<br><br>
        <b><font size="6" color="gray">차량 수정</font></b>
        <h5>(1/5)</h5>
        <br>          
        
        <form method="post" action="vehicle_modify_2step.jsp?car_number=<%=car_number %>" 
                name="carinfo">
        	<table>
            <tr>
                <td id="id">차량번호</td>
                <td><%=car_number %></td>
            </tr>
                        
            <tr>
                <td id="price">가격</td>
                <td>
                	<input type="text" name="price" maxlength="20" 
                            value="<%=price %>">
                </td>
            </tr>
                    
            <tr>
                <td id="year">연식(yyyy.mm)</td>
                <td>
                	<input type="text" name="year" maxlength="20" 
                            value="<%=year %>">
                </td>
            </tr>
                    
            <tr>
                <td id="distance">주행거리</td>
                <td>
                	<input type="text" name="distance" maxlength="20" 
                            value="<%=distance %>">
                </td>
            </tr>
        </table>
        <input type="button" value="취소" onclick="location.href='vehicle_update.jsp'">
        <input type="hidden" name='id' value="<%=id%>">
        <input type="hidden" name='category' value="<%=category%>">
        <input type="hidden" name='engine_displacement' value="<%=engine_displacement%>">
        <input type="hidden" name='transmission' value="<%=transmission%>">
        <input type="hidden" name='color' value="<%=color%>">
        <input type="hidden" name='fuel' value="<%=fuel%>">
        <input type="hidden" name='model_name' value="<%=model%>">
        <input type="hidden" name='m_name' value="<%=make%>">
        <input type="hidden" name='detail_model_name' value="<%=detail_model%>">
        <input type="submit" value="다음">
        </form>
        
        
</body>

</html>