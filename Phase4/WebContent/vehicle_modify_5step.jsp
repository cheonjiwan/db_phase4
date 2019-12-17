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
        <h5>(5/5)</h5>
        <br>     
        
 <% 
 int flag=0;
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
		Statement stmt = null;
		//ResultSet rs;
		ResultSetMetaData rsmd;
		
		request.setCharacterEncoding("euc-kr");
		
		String id=request.getParameter("id");
		String car_number = request.getParameter("car_number");
    	String price = request.getParameter("price");
    	String year = request.getParameter("year");
    	String distance = request.getParameter("distance");
    	
    	String category = request.getParameter("category");
    	String engine_displacement = request.getParameter("engine_displacement");
    	String transmission = request.getParameter("transmission");
    	String real_color = request.getParameter("color");
    	String real_fuel = request.getParameter("fuel");
    	
    	
    	
    	String[] color=real_color.split(" ");
    	String[] fuel=real_fuel.split(" ");
    	
    	System.out.println(category+engine_displacement+transmission+"5");
    	
    	String m_name=request.getParameter("m_name");
    	String model_name=request.getParameter("model_name");
		String detail_model_name=request.getParameter("detail_model_name");
		
    	//
    	
    	
    	
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+detail_model_name);
		
		String query="";
		String query2 = "";
		
		stmt=conn.createStatement();
	
		//pstmt = conn.prepareStatement(query);
		//rs = pstmt.executeQuery();
		%>
		
		<form action="vehicle_modify_final.jsp" method="post">
		<table>
              
            <tr>
                <td id="category">차종</td>
                <td>
                    <select name="category">
					    <option value=<%=category %>><%=category %></option>
					    <%
						    try 
					        {
						    	query="select c_name from category";
					            rs=stmt.executeQuery(query);
					            while(rs.next()){
					            	if(!rs.getString(1).equals(category))
					                	out.println("<option value="+rs.getString(1)+">"+rs.getString(1)+"</option>");
					                
					            }
					        } 
					        catch (SQLException e1) 
					        {
					            // TODO Auto-generated catch block
					            e1.printStackTrace();
					        }
					    %>
					</select>
                </td>
            </tr>
                    
            <tr>
                <td id="engine_displacement">배기량</td>
                <td>
                    <select name="engine_displacement">
					    <option value=<%=engine_displacement %>><%=engine_displacement %></option>
					    <%
						    try 
					        {
						    	query="select quantity from engine_displacement";
					            rs=stmt.executeQuery(query);
					            while(rs.next()){
					            	if(!rs.getString(1).equals(engine_displacement))
					                	out.println("<option value="+rs.getString(1)+">"+rs.getString(1)+"</option>");
					                
					            }
					        } 
					        catch (SQLException e1) 
					        {
					            // TODO Auto-generated catch block
					            e1.printStackTrace();
					        }
					    %>
					</select>
                </td>
            </tr>
                    
            <tr>
                <td id="transmission">기어</td>
                <td>
                    <select name="transmission">
					    <option value=<%=transmission %>><%=transmission %></option>
					    <%
						    try 
					        {
						    	query="select type from transmission";
					            rs=stmt.executeQuery(query);
					            while(rs.next()){
					            	if(!rs.getString(1).equals("transmission"))
					                	out.println("<option value="+rs.getString(1)+">"+rs.getString(1)+"</option>");
					                
					            }
					        } 
					        catch (SQLException e1) 
					        {
					            // TODO Auto-generated catch block
					            e1.printStackTrace();
					        }
					    %>
					</select>
                </td>
            </tr>
        </table>
<%
		query="select type from color";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			String name=rs.getString(1);
			for(int i=0; i <color.length; i++)
			{
				if(color[i].equals(name))
				{
					%>
					<input type='checkbox' name='color' value="<%=name %>" checked/><%=name %>
					<%
				}else
				{
					%>
					<input type='checkbox' name='color' value="<%=name %>"/><%=name %>
					<%		
				}
					
			}
			%>
			
		<%
		}
		out.println("<br>");
		out.println("<br>");
		
		query="select type from fuel";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		while(rs.next())
		{
			String name=rs.getString(1);
			for(int i=0; i< fuel.length; i++)
			{
				if(fuel[i].equals(name))
				{
					%>
					<input type='checkbox' name='fuel' value="<%=name %>" checked/><%=name %>
					<%
				}else
				{
					%>
					<input type='checkbox' name='fuel' value="<%=name %>"/><%=name %>
					<%		
				}
			}
			%>
			
			<%
		}
		%>
		<input type="hidden" name='id' value="<%=id%>">
			<input type="hidden" name='car_number' value="<%=car_number%>">
			<input type="hidden" name='price' value="<%=price%>">
			<input type="hidden" name='distance' value="<%=distance%>">
			<input type="hidden" name='year' value="<%=year%>">
			<input type="hidden" name='m_name' value="<%=m_name %>">
			<input type='hidden' name='model_name' value="<%=model_name %>"/>
			<input type='hidden' name='detail_model_name' value="<%=detail_model_name %>"/>
			
		<input type="submit" value="next">
	</form>
	 
</body>
</html>