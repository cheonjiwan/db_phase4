<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java"
	import="java.text.*,java.sql.*, java.util.*,java.util.ArrayList"%>
<%@ page session = "true" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<b><font size="6" color="gray">차량 수정</font></b>
        <h5>(4/5)</h5>
        <br>      
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
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String id=request.getParameter("id");
		String car_number = request.getParameter("car_number");
    	String price = request.getParameter("price");
    	String year = request.getParameter("year");
    	String distance = request.getParameter("distance");
    	String category = request.getParameter("category");
    	String engine_displacement = request.getParameter("engine_displacement");
    	String transmission = request.getParameter("transmission");
    	String color = request.getParameter("color");
    	String fuel = request.getParameter("fuel");
    	
    	String m_name=request.getParameter("m_name");
    	String model_name=request.getParameter("model_name");
    	String detail_model_name=request.getParameter("detail_model_name");
		String query="";
		System.out.println(model_name);
		
		System.out.println(category+engine_displacement+transmission+"4");
		
		
		if((m_name.equals("null")||m_name==null)&&(model_name==null||model_name.equals("null")))
			{
				query = "select detail_model_name from detail_model";
			}
		else if(model_name!=null)//make입력시
			query="select detail_model_name from detail_model where model_name='"+model_name.replace("/","")+"'";
	      else
	         query="select detail_model_name from detail_model where m_number=(select m_number from make where name='"+m_name.replace("/","")+"')";
	
		System.out.println(query);
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		%>
		
		<form action="vehicle_modify_5step.jsp" method="post">
		<%
		while(rs.next())
		{
			String name=rs.getString(1);
			%>
			<input type="hidden" name='id' value="<%=id%>">
			<input type="hidden" name='car_number' value="<%=car_number%>">
			<input type="hidden" name='price' value="<%=price%>">
			<input type="hidden" name='distance' value="<%=distance%>">
			<input type="hidden" name='year' value="<%=year%>">
		
		<input type="hidden" name='category' value="<%=category%>">
       		 <input type="hidden" name='engine_displacement' value="<%=engine_displacement%>">
      		  <input type="hidden" name='transmission' value="<%=transmission%>">
      		  <input type="hidden" name='color' value="<%=color%>">
     		   <input type="hidden" name='fuel' value="<%=fuel%>">
     		   
			<input type="hidden" name='m_name' value="<%=m_name %>">
			<input type='hidden' name='model_name' value="<%=model_name %>"/>
			<%
			if(detail_model_name.equals(name))
			{
				%>
				<input type='radio' name='detail_model_name' value="<%=name %>" checked/><%=name %>
				<%
			}else
			{
				%>
				<input type='radio' name='detail_model_name' value="<%=name %>"/><%=name %>
				<%
			}
			%>
			
			<%
		}
		
		%>
		<input type="submit" value="next">
	</form>
</body>
</html>