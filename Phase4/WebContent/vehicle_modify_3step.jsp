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
<script type="text/javascript">

function nextcheck() {

	if(document.fr.check.value=="0")
	{
		alert("체크 해주세요.");
		return false;	
	}
	
}
function input_Text(){
	document.fr.check.value = "1";
}


</script>
</head>
<body>
<b><font size="6" color="gray">차량 수정</font></b>
        <h5>(3/5)</h5>
        <br>          
<% 
		int nextcheck=0;
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
		
		
		
		String query="";
		
		System.out.println("testtesttest");
		
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
    	
    	
    	System.out.println(category+engine_displacement+transmission);
    	System.out.println(m_name);
    	
    	
		if(m_name==null||m_name.equals("null"))
			{
				query = "select model_name from model";
			}
		else
			query="select model_name from model where m_number=(select m_number from make where name='"+m_name.replace("/","")+"')";
		System.out.println(query);
		System.out.println(m_name);
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		%>
		
		<form action="vehicle_modify_4step.jsp" method="post" name="fr" onsubmit="return nextcheck()">
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
			<input type="hidden" name='detail_model_name' value="<%=detail_model_name%>">
			<%
			if(model_name.equals(name))
			{
				%>
				<input type='radio' name='model_name' value="<%=name %>" checked/><%=name %>
				<%
				nextcheck=1;
			}
			else
			{
				%>
				<input type='radio' name='model_name' value="<%=name %>" onclick='input_Text()'/><%=name %>
				<%
			}
			%>
			
			<%
		}
		
		%>
		<%
		if(nextcheck==1)
		{
			%>
			<input type="text" name="check" value="1">
			<%		
		}else
		{
			%>
			<input type="text" name="check" value="0">
			<%
		}
		 %>
		<input type="submit" value="next">
	</form>
</body>
</html>