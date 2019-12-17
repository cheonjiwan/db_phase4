<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java"
	import="java.text.*,java.sql.*, java.util.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
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
<body>
<b><font size="6" color="gray">차량 수정</font></b>
<h3>상위 모델 수정시 하위 모델은 반드시 수정해야 합니다.</h3>
        <h5>(2/5)</h5>
        <%
        int nextcheck=0;
        String car_number = request.getParameter("car_number");
    	String price = request.getParameter("price");
    	String year = request.getParameter("year");
    	String distance = request.getParameter("distance");
    	String category = request.getParameter("category");
    	String engine_displacement = request.getParameter("engine_displacement");
    	String transmission = request.getParameter("transmission");
    	String color = request.getParameter("color");
    	String fuel = request.getParameter("fuel");
    	
    	System.out.println(category+engine_displacement+transmission+"2");
    	String m_name = request.getParameter("m_name");
    	String model_name = request.getParameter("model_name");
    	String detail_model_name = request.getParameter("detail_model_name");
    	/* String make = (String)session.getAttribute("make");
    	String model = (String)session.getAttribute("model");
    	String detail_model = (String)session.getAttribute("detail_model");
    	String category = (String)session.getAttribute("category");
    	String engine_displacement = (String)session.getAttribute("engine_displacement");
    	String transmission= (String)session.getAttribute("transmission");
    	String color = (String)session.getAttribute("color");
    	String fuel = (String)session.getAttribute("fuel"); */
    	
    	//out.println(price+year+distance);
        %>
        
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
		
		String query = "select name from make";
		
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		%>
		
		<form action="vehicle_modify_3step.jsp" method="post" name="fr" onsubmit="return nextcheck()">
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
     		   <input type="hidden" name='model_name' value="<%=model_name%>">
			<input type="hidden" name='detail_model_name' value="<%=detail_model_name%>">
			
			<%
			if(m_name.equals(name))
			{
				%>
				<input type='radio' name='m_name' value="<%=name %>" checked ><%=name %>
				
				<%
				nextcheck=1;
			}
			else
			{
				%>
				<input type='radio' name='m_name' value="<%=name %>" onclick='input_Text()'><%=name %>
				
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
			<input type="hidden" name="check" value="1">
			<%		
		}else
		{
			%>
			<input type="hidden" name="check" value="0">
			<%
		}
		 %>
		<input type="submit" value="next">
	</form>
</body>
</html>